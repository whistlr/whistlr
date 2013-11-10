module Stat::Whistlr
  extend ActiveSupport::Concern

  included do
    after_create :increment_user_stats
  end

  def stats
    user.whistlr_stats.present? ? user.whistlr_stats : user.create_whistlr_stats
  end

  def accepted_submission
    stats.update_attributes(accepted_reports: stats.accepted_reports + 1, details_provided: stats.details_provided + version_attributes.details_provided)
  end

  def accepted_edit
    stats.update_attributes(accepted_edits: stats.accepted_edits + 1, details_provided: stats.details_provided + version_attributes.details_provided)
  end

  def rejected_submission
    stats.update_attributes(rejected_reports: stats.rejected_reports + 1)
  end

  def rejected_edit
    stats.update_attributes(rejected_edits: stats.rejected_edits + 1)
  end

private

  def increment_user_stats
    if initial?
      stats.update_attributes(submitted_reports: stats.submitted_reports + 1)
    else
      stats.update_attributes(submitted_edits: stats.submitted_edits + 1)
    end
  end
end
