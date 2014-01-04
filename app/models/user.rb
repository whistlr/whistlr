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

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    :uniqueness => { :case_sensitive => false }
  validates :name, presence: true, length: { maximum: 80 },
    :uniqueness => { :case_sensitive => false }
  validates_presence_of :slug

  before_validation :assign_default_name
  before_save :ensure_authentication_token!

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
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
 
  def ensure_authentication_token!
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

private

  def assign_default_name
    self.name = generate_default_name if name.blank?
  end

  def generate_default_name
    loop do
      name = default_name_string
      break name unless User.where(name: name).exists?
    end
  end

  def default_name_string
    "user_" + Random.new.rand(1111..9999999999999999999).to_s
  end
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
