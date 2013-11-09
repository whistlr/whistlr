class Report::Evidence::Join < ActiveRecord::Base
  belongs_to :report
  belongs_to :evidence, class_name: "Report::Evidence"

  accepts_nested_attributes_for :evidence
end
