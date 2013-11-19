module Versions::LikeAVersion
  extend ActiveSupport::Concern

  included do
    attr_accessor :user, :notes, :initial

    belongs_to :master, class_name: self.name.gsub("Version", "Master")
    has_one :version_attributes, as: :versionable

    validate :is_altered

    after_save :create_version_attributes_with_extra_params, :follow
    
    scope :approved, -> { includes(:version_attributes).where("version_attributes.approved = true") }
    scope :initial, -> { includes(:version_attributes).where("version_attributes.initial = true").first }
  end

  def versionable_attributes
    self.attributes.except("id", "type", "approved", "declined", "pending", "master_id", "responses_sum", "responses_disapprove", "responses_approve", "controversy", "disinterest")
  end

  def success_handling
    if initial?
      master.update_attributes(approved: true, pending: false)
      accepted_submission if respond_to?(:accepted_submission)
    else
      master.update_attributes(versionable_attributes)
      accepted_edit if respond_to?(:accepted_edit)
    end
  end

  def failure_handling
    if self.initial?
      master.update_columns(pending: false, declined: true)
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
    versionable_attributes.inject(0) do |count, attribute|
      detail_is_new(attribute) ? count + 1 : count
    end
  end

  def detail_is_new(attribute)
    initial? ? attribute[1].present? : attribute[1] != previous.public_send(attribute[0])
  end

private

  def is_altered
    errors[:base] << I18n.t("errors.shared.no_changes") if details_count == 0
  end

  def create_version_attributes_with_extra_params
    create_version_attributes(initial: @initial, details_provided: details_count)
  end

  def follow
    user.create_following_if_none(master)
  end

end