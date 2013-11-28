module Validations::UserCreated
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end

end