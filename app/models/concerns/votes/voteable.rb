module Votes::Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable

    scope :approved, -> { where(approved: true) }
    scope :pending, -> { where(pending: true) }
    scope :declined, -> { where(declined: true) }
  end

  def success
    self.update_columns(pending: false, approved: true, declined: false) if respond_to? :pending
    self.voteable_records.update_columns(pending: false, approved: true, declined: false)
    self.success_handling if self.respond_to?(:success_handling)
  end

  def failure
    self.update_columns(pending: false, approved: false, declined: true) if respond_to? :pending
    self.voteable_records.update_columns(pending: false, approved: false, declined: true)
    self.failure_handling if self.respond_to?(:failure_handling)
  end

  def sum_votes
    votes.sum(:value)
  end

  def sum_nays
    votes.nay_votes.sum(:value).abs
  end

  def sum_yeas
    votes.yea_votes.sum(:value)
  end

end
