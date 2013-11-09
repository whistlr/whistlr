class UploadSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_one :file
end
