require 'faker'

FactoryGirl.define do
  factory :report_participant, class: "Report::Participant" do

    summary { [Faker::Company.catch_phrase, ""].sample }
    involvement { [-3, -2, -1, 1, 2, 3].sample }

    reportable {
      [ Official::Master.offset(rand(Official::Master.count)).first,
        Organization::Master.offset(rand(Organization::Master.count)).first,
        Product::Master.offset(rand(Product::Master.count)).first].sample ||
      create(:organization_master)
    }

    factory :invalid_report_participant do
      reportable nil
    end
  end
end
