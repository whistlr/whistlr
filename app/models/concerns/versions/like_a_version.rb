module Versions::LikeAVersion
  extend ActiveSupport::Concern

  included do
    attr_accessor :user, :notes, :initial

    belongs_to :master, class_name: self.name.gsub("Version", "Master")
    has_one :version_attributes, as: :versionable

    after_create :create_version_attributes_with_extra_params
    
    scope :approved, -> { includes(:version_attributes).where("version_attributes.approved = true") }
    scope :initial, -> { includes(:version_attributes).where("version_attributes.initial = true").first }
  end

  def success_handling
    if initial?
      master.update_columns(approved: true, pending: false)
    else
      master.update_columns(self.attributes.except("id", "type", "approved", "declined", "pending", "master_id"))
    end
  end

  def failure_handling
    master.update_columns(declined: true, pending: false) if initial?
  end

  def initial?
    @initial || version_attributes.initial
  end

private

  def create_version_attributes_with_extra_params
    create_version_attributes(initial: @initial)
  end

end