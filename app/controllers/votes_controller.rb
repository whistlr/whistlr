class VotesController < ApplicationController

  def create
    authorize! :create, Vote.new(voteable_type: params[:voteable_type])
    vote = Vote.cast_vote(vote_params)
    render json: vote.voteable.poll_attributes, serializer: VoteableSerializer
  end

private

  def vote_params
    params.require(:vote).permit(:voteable_type, :voteable_id, :value).merge(user: current_user)
  end
end
