module Attributes::Social
  extend ActiveSupport::Concern
  include Validations::Regexes

  included do
    validates :twitter_alias, allow_blank: true, format: { with: VALID_TWITTER_REGEX }
    validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }
    validate :find_facebook_id
  end

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