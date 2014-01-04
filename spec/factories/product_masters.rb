require 'faker'

FactoryGirl.define do
  factory :product_master, class: "Product::Master" do
    name { Faker::Company.name }

    organization { Organization::Master.approved.offset(rand(Organization::Master.approved.count)).first || create(:organization_master) }

    user { User.offset(rand(User.count)).first || create(:user) }

    factory :invalid_product_master do
      name nil
    end
  end
end
