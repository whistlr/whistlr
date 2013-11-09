class VersionAttributesSerializer < ActiveModel::Serializer

  attributes :id, :initial, :versionable, :versionableType, :previous, :previousType

  def previous
    object.previous_id
  end

  def previousType
    object.previous_type.gsub("::", "") if object.previous_type.present?
  end

  def versionable
    object.versionable_id
  end

  def versionableType
    object.versionable_type.gsub("::", "")
  end

end
