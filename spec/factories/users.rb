require 'faker'

FactoryGirl.define do
  factory :user do
    email {
      loop do
        email = Faker::Internet.free_email
        break email unless User.where(email: email).exists?
      end
    }
    name {
      loop do
        name = [Faker::Name.name, ""].sample
        break name unless User.where(name: name).exists?
      end
    }
    password { Faker::Lorem.characters( char_count = rand(8..25) ) }

    factory :invalid_user do
      email nil
    end
  end
end
