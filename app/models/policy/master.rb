class Policy::Master < Policy
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable

  def active_model_serializer
    PolicySerializer
  end

end