class RecentActivitiesController < ApplicationController

  respond_to :json, :html

  def index
    if user_signed_in?
      params[:page] ||= 0
      params[:per_page] ||= 25
      query_elements = current_user.follows.collect{ |follow| "timelineable_type = '#{follow.followable_type}' AND timelineable_id = #{follow.followable.id}"}
      if query_elements.any?
        query_string = query_elements.join ") OR ("
        query_string = "SELECT * FROM ( SELECT DISTINCT ON (eventable_id, eventable_type) * FROM events WHERE (#{query_string}) ORDER BY eventable_id, eventable_type DESC ) q ORDER BY q.created_at DESC LIMIT #{params[:per_page]} OFFSET #{params[:page].to_i*15}"
        events = Event.find_by_sql(query_string)
      else
        events = []
      end
    else
      events = []
    end
    respond_with events, each_serializer: EventSerializer, root: :events
  end
end