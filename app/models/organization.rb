class Organization < ActiveRecord::Base
  include Attributes::Social
  include Attributes::Uploadable

  strip_attributes

  belongs_to :parent, -> { where type: "Organization::Master" }, class_name: "Organization"
  has_many :children, -> { where type: "Organization::Master" }, class_name: "Organization", foreign_key: :parent_id
  has_many :products
  has_many :policies

  validates :name, presence: true

end