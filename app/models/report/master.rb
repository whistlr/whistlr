class Report::Master < Report
  include Events::Timelineable
  include Versions::Versionable

  def active_model_serializer
    ReportSerializer
  end

end
