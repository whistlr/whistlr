class UserSerializer < ActiveModel::Serializer
  attributes :name, :id, :archivist_reputation, :whistlr_reputation
end
