class ReportVersionSerializer < ActiveModel::Serializer
  root :report
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :description, :summary

  has_many :participants, root: :report_participants
  has_many :evidence, root: :report_evidence

  has_one :master, root: :report
  has_one :version_attributes
  has_one :poll_attributes
end
