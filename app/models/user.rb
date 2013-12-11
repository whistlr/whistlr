class User < ActiveRecord::Base
  include Events::Timelineable
         
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follows, dependent: :destroy
  has_many :responses, class_name: "Report::Response", dependent: :destroy
  has_many :votes, dependent: :destroy

  has_one :developer_stats, class_name: "User::DeveloperStat"
  has_one :designer_stats, class_name: "User::DesignerStat"
  has_one :whistlr_stats, class_name: "User::WhistlrStat"
  has_one :archivist_stats, class_name: "User::ArchivistStat"
  has_one :marketer_stats, class_name: "User::MarketerStat"
  has_one :community_stats, class_name: "User::CommunityStat"
  has_one :translator_stats, class_name: "User::TranslatorStat"
  has_one :author_stats, class_name: "User::AuthorStat"

  before_save :assign_default_name, :ensure_authentication_token!
 
  def ensure_authentication_token!
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def vote_for(voteable)
    vote = votes.find_by(voteable: voteable)
    vote.try(:value)
  end

  def response_for(report)
    response = responses.find_by(report: report)
    response.try(:value)
  end

  def following(followable)
    follows.where(followable: followable).exists?
  end

  def create_following_if_none(followable)
    follows.create(followable: followable) unless following(followable)
  end

private

  def assign_default_name
    self.name = generate_default_name if name.blank?
  end

  def generate_default_name
    name = "user_" + default_name_string
    generate_default_name if User.where(name: name).exists?
  end

  def default_name_string
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...8).map{ o[rand(o.length)] }.join
  end
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
