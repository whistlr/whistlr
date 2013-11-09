class EventsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    events = Event.where(query_params(Event)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with events
  end

end