class ReportEvidenceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :citation, :url, :id

  has_one :previous, root: :report_evidence

  has_many :reports

end
