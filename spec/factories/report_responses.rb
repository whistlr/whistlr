require 'faker'

FactoryGirl.define do
  factory :report_response, class: "Report::Response" do
    user { User.offset(rand(User.count)).first || create(:user) }
    report { Report::Master.approved.offset(rand(Report::Master.approved.count)).first ||
               create(:report_master) }
    value { [-1, 1].sample }

    factory :invalid_response do
      report nil
    end
  end
end
