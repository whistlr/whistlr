class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  belongs_to :timelineable, polymorphic: true
end
