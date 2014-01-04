require 'faker'

FactoryGirl.define do
  factory :report_evidence, class: "Report::Evidence" do

    citation { Faker::Company.catch_phrase }

    factory :invalid_report_evidence do
      citation nil
    end
  end
end
