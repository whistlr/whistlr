class GenericController < ApplicationController
  respond_to :json, :html

  def index
    respond_with nil
  end

  def show
    respond_with nil
  end
end