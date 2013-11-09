class ReportBareSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes  :id, :description, :summary, :approved

  has_many :participants, root: :report_participants, each_seralizer: ReportParticipantBareSerializer
  has_many :evidence, root: :report_evidence, each_seralizer: ReportEvidenceBareSerializer
end
