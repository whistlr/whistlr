class Report::ParticipantsController < ApplicationController
  respond_to :json, :html

  def show
    respond_with Report::Participant.find(params[:id])
  end

end