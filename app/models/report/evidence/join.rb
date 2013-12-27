class Report::Evidence::Join < ActiveRecord::Base
  belongs_to :report
  belongs_to :evidence, class_name: "Report::Evidence"

  validates_presence_of :report
  validates_presence_of :evidence

  accepts_nested_attributes_for :evidence
end
