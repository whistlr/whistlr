class Report::Evidence < ActiveRecord::Base
  include Attributes::Uploadable

  strip_attributes

  has_many :reports, through: :report_joins
  has_many :report_joins, class_name: "Report::Evidence::Join"

  belongs_to :previous, class_name: "Report::Evidence"
  has_one :next, class_name: "Report::Evidence", foreign_key: :previous_id

  mount_uploader :file, FileUploader

  def active_model_serializer
    ReportEvidenceSerializer
  end

end
