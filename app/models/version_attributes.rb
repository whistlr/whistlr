class VersionAttributes < ActiveRecord::Base
  belongs_to :previous, polymorphic: true
  belongs_to :versionable, polymorphic: true

  before_create :set_previous

  delegate :approved_versions, :initial_version, to: :master, prefix: true
  delegate :master, to: :versionable

private

  def set_previous
    self.previous = master_approved_versions.last || master_initial_version unless initial?
  end

end