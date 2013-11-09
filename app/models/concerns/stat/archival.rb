module Stat::Archival
  extend ActiveSupport::Concern

  included do
    after_create :increment_user_stats
  end

  def stats
    user.archivist_stats.present? ? user.archivist_stats : user.create_archivist_stats
  end

  def accepted_submission
    detail_count = 0
    master_attributes.each do |attr|
      detail_count += 1 unless attr[1].blank?
    end
    stats.update_attributes(accepted_records: stats.accepted_records + 1, details_provided: stats.details_provided + detail_count)
  end

  def accepted_edit
    detail_count = 0
    revised_attributes.each do |attr|
      detail_count += 1
    end
    stats.update_attributes(accepted_edits: stats.accepted_edits + 1, details_provided: stats.details_provided + detail_count)
  end

  def rejected_submission
    stats.update_attributes(rejected_records: stats.rejected_records + 1)
  end

  def rejected_edit
    stats.update_attributes(rejected_edits: stats.rejected_edits + 1)
  end

private

  def increment_user_stats
    if initial?
      stats.update_attributes(submitted_records: stats.submitted_records + 1)
    else
      stats.update_attributes(submitted_edits: stats.submitted_edits + 1)
    end
  end
end
