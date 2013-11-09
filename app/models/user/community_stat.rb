class User::CommunityStat < ActiveRecord::Base
  include Stat::Base

  multipliers comment_popularity: 1, post_popularity: 1

end
