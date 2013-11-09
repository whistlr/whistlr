class User::OrganizerStat < ActiveRecord::Base
  include Stat::Base

  multipliers accepted_projects: 1, rejected_projects: -5, abandoned_projects: -10, completed_projects: 2, project_participants: 1, project_popularity: 1

end
