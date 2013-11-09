module Events::Timelineable
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :timelineable, dependent: :destroy
  end

end