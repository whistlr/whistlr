class AffiliationSerializer < ActiveModel::Serializer
  root :affiliation
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :amount, :shares, :start_date, :end_date, :title
  has_one :organization
  has_one :official

end
