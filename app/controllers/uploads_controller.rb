class UploadsController < ApplicationController

  def create
    upload = Upload.new(upload_params)
    upload.save
    render json: {upload: upload, authenticity_token: form_authenticity_token}, status: 201
  end

  def show
  end

  private

    def upload_params
      params.require(:upload).permit(:file).merge(user: current_user)
    end
end