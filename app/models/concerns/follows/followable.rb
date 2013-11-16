module Follows::Followable
  extend ActiveSupport::Concern

  included do
    has_many :followings, dependent: :destroy, class_name: "Follow", as: :followable
  end

end
