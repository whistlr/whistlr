require 'faker'

FactoryGirl.define do
  factory :organization_master, class: "Organization::Master" do
    name { Faker::Company.name }
    country { [Faker::Address.country, ""].sample }
    city { [Faker::Address.city, ""].sample }
    region { [Faker::Address.state, ""].sample }

    parent_id {
      if Organization::Master.approved.exists?
        [Organization::Master.approved.offset(rand(Organization::Master.approved.count)).first.id,
        nil, nil].sample
      else
        nil
      end
    }

    user { User.offset(rand(User.count)).first || create(:user) }

    factory :invalid_organization_master do
      name nil
    end
  end
end
