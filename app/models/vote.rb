class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validate :the_voteable_event_is_still_active

  scope :yea_votes, -> { where("value > 0") }
  scope :nay_votes, -> { where("value < 0") }

  before_destroy :the_voteable_event_is_still_active
  after_destroy :tally_votes, :check_for_majority
  after_save :tally_votes, :check_for_majority

  def self.cast_vote(params)
    value = params[:value]
    vote = Vote.where(user: params[:user],
      voteable_type: params[:voteable_type],
      voteable_id: params[:voteable_id]).first_or_initialize(value: value)
    Vote.handle_vote(vote, value)
  end

  def voteable_records
    voteable.voteable_records
  end

private

  def self.handle_vote(vote, value)
    if vote.new_record?
      vote.save
    elsif vote.value == value.to_i
      vote.destroy
    else
      vote.update_attributes(value: value)
    end
    return vote
  end

  def the_voteable_event_is_still_active
    if voteable.respond_to?(:pending?) && !voteable.pending?
      errors[:base] << "No longer active"
      return false
    end
  end

  def tally_votes
    voteable_records.update_column(:votes_sum, voteable.sum_votes) if voteable_records.respond_to?(:votes_sum)
    voteable_records.update_column(:votes_nay, voteable.sum_nays) if voteable_records.respond_to?(:votes_nay)
    voteable_records.update_column(:votes_yea, voteable.sum_yeas) if voteable_records.respond_to?(:votes_yea)
    popularize_votes if voteable_records.respond_to?(:votes_popularity)
  end

  def popularize_votes
    # SQL inspired by http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
    popularity = Vote.find_by_sql("
      SELECT
        COALESCE((((v.positive + 1.9208) / (v.positive + v.negative) -
        1.96 * SQRT((v.positive * v.negative) / (v.positive + v.negative) + 0.9604) /
        (v.positive + v.negative)) / (1 + 3.8416 / (v.positive + v.negative)) * 100), 0) AS popularity
      FROM
        #{self.voteable_type.underscore.gsub('/', "_").pluralize} voteable
          Left Outer Join(
            SELECT
              voteable_id,
              Sum(Case When value > 0 Then value Else 0 End) AS positive,
              Sum(Case When value < 0 Then value Else 0 End) * -1 AS negative
            FROM
              votes
            WHERE
              voteable_type = '#{self.voteable_type}' AND voteable_id = '#{self.voteable_id}'
          ) v ON voteable.id = v.voteable_id
      WHERE id = #{self.voteable_id}
    ").first.popularity
    voteable_records.update_column(:votes_popularity, popularity)
  end

  def check_for_majority
    if voteable.respond_to?(:success) && (!voteable_records.respond_to?(:votes_sum) || voteable_records.votes_sum >= 1)
      voteable.success
    elsif voteable.respond_to?(:failure) && (!voteable_records.respond_to?(:votes_sum) || voteable_records.votes_sum <= -1)
      voteable.failure
    end
  end

end
