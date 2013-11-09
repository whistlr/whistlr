module Stat::Whistlr
  extend ActiveSupport::Concern

  included do
    after_create :increment_user_stats
  end

  def user_stats
    stats = user.whistlr_stats.present? ? user.whistlr_stats : user.create_whistlr_stats
  end

  def accepted_submission
    detail_count = 0
    submitted_models = [self]
    submitted_models.concat(report.implicants.where(submitted_with_report: true).collect {|implicant| implicant.versions.first})
    submitted_models.concat(report.evidence.where(submitted_with_report: true).collect {|evidence| evidence.versions.first})
    submitted_models.each do |model|
      model.master_attributes.each do |attr|
        detail_count += 1 unless attr[1].blank?
      end
    end
    stats = user_stats
    stats.update_attributes(accepted_reports: stats.accepted_reports + 1, details_provided: stats.details_provided + detail_count)
  end

  def accepted_edit
    detail_count = 0
    revised_attributes.each do |attr|
      detail_count += 1
    end
    stats = user_stats
    stats.update_attributes(accepted_edits: stats.accepted_edits + 1, details_provided: stats.details_provided + detail_count)
  end

  def rejected_submission
    stats = user_stats
    stats.update_attributes(rejected_reports: stats.rejected_reports + 1)
  end

  def rejected_edit
    stats = user_stats
    stats.update_attributes(rejected_edits: stats.rejected_edits + 1)
  end

private

  def increment_user_stats
    stats = user_stats
    if initial?
      stats.update_attributes(submitted_reports: stats.submitted_reports + 1)
    else
      stats.update_attributes(submitted_edits: stats.submitted_edits + 1)
    end
  end
end
