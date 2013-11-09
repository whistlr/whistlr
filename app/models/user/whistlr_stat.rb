class User::WhistlrStat < ActiveRecord::Base
  include Stat::Base

  multipliers accepted_whistles: 1, rejected_whistles: -5, accepted_edits: 1, rejected_edits: -5, details_provided: 1, whistle_popularity: 1

end
