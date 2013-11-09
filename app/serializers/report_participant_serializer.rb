class ReportParticipantSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :involvement, :summary, :reportableType, :reportable, :id

  has_many :reports

  def reportableType
    object.reportable_type
  end

  def reportable
    object.reportable_id
  end

end
