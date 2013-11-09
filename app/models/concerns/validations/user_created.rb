module Validations::UserCreated
  extend ActiveSupport::Concern

  included do
    belongs_to :user

    validate :user_signed_in
  end

private

  def user_signed_in
    unless user.present?
      errors[:base] << I18n.t("errors.shared.must_be_signed_in")
    end
  end

end