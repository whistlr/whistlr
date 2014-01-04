require 'faker'

FactoryGirl.define do
  factory :report_master, class: "Report::Master" do

    summary { Faker::Company.catch_phrase }
    description { Faker::Company.bs }

    user { User.offset(rand(User.count)).first || create(:user) }

    after(:build) do |report|
      report.participants << FactoryGirl.build(:report_participant)
      report.evidence << FactoryGirl.build(:report_evidence)
    end

    factory :invalid_report do
      summary nil
    end
  end
end
