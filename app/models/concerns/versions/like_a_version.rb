module Versions::LikeAVersion
  extend ActiveSupport::Concern

  included do
    attr_accessor :user, :notes, :initial

    belongs_to :master, class_name: self.name.gsub("Version", "Master")
    has_one :version_attributes, as: :versionable

    validate :is_altered

    after_save :create_version_attributes_with_extra_params
    
    scope :approved, -> { includes(:version_attributes).where("version_attributes.approved = true") }
    scope :initial, -> { includes(:version_attributes).where("version_attributes.initial = true").first }
  end

  def failure_handling
    if self.initial?
      versionable.update_column(:pending, false)
      rejected_submission if respond_to?(:rejected_submission)
    else
      rejected_edit if respond_to?(:rejected_edit)
    end
  end

  def success_handling
    if initial?
      master.update_columns(approved: true, pending: false)
      accepted_submission if respond_to?(:accepted_submission)
    else
      master.update_columns(self.attributes.except("id", "type", "approved", "declined", "pending", "master_id"))
      accepted_edit if respond_to?(:accepted_edit)
    end
  end

  def failure_handling
    if self.initial?
      versionable.update_columns(pending: false, declined: true)
      rejected_submission if respond_to?(:rejected_submission)
    else
      rejected_edit if respond_to?(:rejected_edit)
    end
  end

  def initial?
    @initial || version_attributes.try(:initial)
  end

  def previous
    master.last_approved_version
  end

  def details_count
    @initial ? attribute_count : alteration_count
  end

  def alteration_count
    count = 0
    attributes.except("id", "type", "approved", "declined", "pending", "master_id").each do |attribute|
      count += 1 if attribute[1] != previous.public_send(attribute[0])
    end
    count
  end

  def attribute_count
    count = 0
    attributes.except("id", "type", "approved", "declined", "pending", "master_id").each do |attribute|
      count += 1 if attribute[1].present?
    end
    count
  end

private

  def is_altered
    if details_count == 0
      errors[:base] << I18n.t("activerecord.errors.messages.no_changes")
    end
  end

  def create_version_attributes_with_extra_params
    create_version_attributes(initial: @initial, details_provided: details_count)
  end

end