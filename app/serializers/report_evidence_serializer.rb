class ReportEvidenceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :citation, :url, :id

  has_many :reports

end
