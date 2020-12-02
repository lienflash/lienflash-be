class Api::V1::Admin::JobsController < Api::V1::Admin::BaseController
  before_action :admin? && :authorized
  def index
    jobs = Job.all
    render json: JobSerializer.new(jobs), status: 200
  end
end
