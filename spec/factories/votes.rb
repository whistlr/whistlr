require 'faker'

FactoryGirl.define do
  factory :vote do
    user { User.offset(rand(User.count)).first || create(:user) }
    voteable { [Official::Version.offset(rand(Official::Version.count)).first,
                Organization::Version.offset(rand(Organization::Version.count)).first,
                Product::Version.offset(rand(Product::Version.count)).first].sample ||
               create(:organization_master).versions.first }
    value { [-1, 1].sample }

    factory :invalid_vote do
      voteable nil
    end
  end
end
