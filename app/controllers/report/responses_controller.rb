class Report::ResponsesController < ApplicationController

  def create
    report = Report.find(params[:response][:report_id])
    authorize! :create, report
    response = report.create_response(report_response_params)
    render json: response.report(true), serializer: ReportResponseSerializer
  end

private

  def report_response_params
    params.require(:response).permit(:value).merge(user: current_user)
  end

end
