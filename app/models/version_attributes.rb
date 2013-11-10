class VersionAttributes < ActiveRecord::Base
  belongs_to :previous, polymorphic: true
  belongs_to :versionable, polymorphic: true

  before_create :set_previous

  delegate :master, to: :versionable

private

  def set_previous
    self.previous = master.last_approved_version unless initial?
  end

end