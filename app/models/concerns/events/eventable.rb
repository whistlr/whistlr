module Events::Eventable
  extend ActiveSupport::Concern

  module ClassMethods
    def add_event_to(*timelines)
      define_method :event_timelines do
        timelines.collect {|stream| public_send stream }
      end
    end
  end

  included do
    has_many :events, as: :eventable, dependent: :destroy

    after_create :assign_event_to_timelines
  end

private

  def assign_event_to_timelines
    assign_event event_timelines
  end

  def assign_event(timelines)
    timelines.each do |timeline|
      if timeline.class.name.include? "ActiveRecord::Associations"
        assign_event timeline
      else
        events.create timelineable: timeline
      end
    end
  end

end
