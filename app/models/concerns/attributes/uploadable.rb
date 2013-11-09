module Attributes::Uploadable
  extend ActiveSupport::Concern

  included do
    belongs_to :upload
  end
end