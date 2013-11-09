class User::ArchivistStat < ActiveRecord::Base
  include Stat::Base

  multipliers accepted_records: 1, rejected_records: -5, accepted_edits: 1, rejected_edits: -5, details_provided: 1

end
