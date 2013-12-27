require 'faker'

FactoryGirl.define do
  factory :user do
    email {
        email = Faker::Internet.free_email
        until !User.where(email: email).exists?
            email = Faker::Internet.free_email
        end
        email
    }
    password { Faker::Lorem.characters( char_count = rand(8..25) ) }
    name { Faker::Name.name }

    factory :invalid_user do
      email nil
    end
  end
end
