class EventSerializer < ActiveModel::Serializer

  attributes :id, :eventable, :eventableType, :created_at

  def eventable
    object.eventable_id
  end

  def eventableType
    object.eventable_type.gsub("::", "")
  end

end
