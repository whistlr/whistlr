module Versions::Versionable
  extend ActiveSupport::Concern

  included do
    attr_accessor :user, :notes

    has_many :versions, class_name: self.name.gsub("Master", "Version"), dependent: :destroy, foreign_key: :master_id

    after_create :clone_initial_version

    scope :approved, -> { where(approved: true) }
    scope :pending, -> { where(pending: true) }
    scope :declined, -> { where(declined: true) }
    scope :not_declined, -> { where(declined: false) }
  end

  def approved_versions
    versions.approved
  end

  def initial_version
    versions.initial
  end

  def create_version(params, initial = false)
    versions.create(params.merge(initial: initial))
  end

  def last_approved_version
    approved_versions.last || initial_version unless versions.length == 0
  end

private

  def clone_initial_version
    params = self.attributes.except("id", "type", "approved", "pending", "declined", "master_id").merge(user: user, notes: notes)
    self.create_version(params, true)
  end
end