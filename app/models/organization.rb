class Organization < ActiveRecord::Base
  include Attributes::Uploadable
  include Validations::Regexes

  strip_attributes

  belongs_to :upload
  belongs_to :parent, -> { where type: "Organization::Master" }, class_name: "Organization"
  has_many :children, -> { where type: "Organization::Master" }, class_name: "Organization", foreign_key: :parent_id

  validates :name, presence: true
  validates :twitter_alias, allow_blank: true, format: { with: VALID_TWITTER_REGEX }
  validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }
  validate :find_facebook_id

private

  def find_facebook_id
    if facebook_alias.present?
      page = FbGraph::Page.fetch(facebook_alias)
      self.facebook_id = page.identifier
    end
  rescue
    errors.add(:facebook_alias, I18n.t("errors.attributes.facebook_alias.invalid"))
  end

end