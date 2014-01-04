require 'faker'

FactoryGirl.define do
  factory :organization_version, class: "Organization::Version" do

    master { Organization::Master.offset(rand(Organization::Master.count)).first || create(:organization_master) }
    initial false

    name { Faker::Company.name }
    country { [Faker::Address.country, ""].sample }
    city { [Faker::Address.city, ""].sample }
    region { [Faker::Address.state, ""].sample }

    parent {
      if Organization::Master.approved.exists?
        [Organization::Master.approved.offset(rand(Organization::Master.approved.count)).first,
        nil, nil].sample
      else
        nil
      end
    }

    user { User.offset(rand(User.count)).first || create(:user) }

    factory :invalid_organization_version do
      name nil
    end
  end
end
