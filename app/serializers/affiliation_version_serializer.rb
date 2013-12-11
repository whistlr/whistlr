class AffiliationVersionSerializer < ActiveModel::Serializer
  root :affiliation
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :amount, :shares, :start_date, :end_date, :title
  has_one :organization
  has_one :official

  has_one :master, root: :affiliations
  has_one :version_attributes
  has_one :poll_attributes
end
