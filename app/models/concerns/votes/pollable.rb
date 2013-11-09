module Votes::Pollable
  extend ActiveSupport::Concern

  included do
    has_one :poll_attributes, as: :pollable

    after_create :create_poll_attributes_with_extra_params
  end

  def voteable_records
    poll_attributes
  end

private

  def create_poll_attributes_with_extra_params
    create_poll_attributes(user: user, notes: notes)
  end
end
