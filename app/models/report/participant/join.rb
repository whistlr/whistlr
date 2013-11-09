class Report::Participant::Join < ActiveRecord::Base
  belongs_to :report
  belongs_to :participant, class_name: "Report::Participant"

  validates_presence_of :report
  validates_presence_of :participant

  accepts_nested_attributes_for :participant
end
