require 'faker'

FactoryGirl.define do
  factory :official_master, class: "Official::Master" do
    name { Faker::Company.name }

    user { User.offset(rand(User.count)).first || create(:user) }

    factory :invalid_official_master do
      name nil
    end
  end
end
