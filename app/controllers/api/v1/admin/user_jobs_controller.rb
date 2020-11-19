class Api::V1::Admin::UserJobsController < Api::V1::Admin::BaseController
  before_action :admin? && :authorized
  def index
    jobs = User.find(params[:id]).jobs
    render json: JobSerializer.new(jobs), status: 200
  end
  
  def show
    job = Job.find(params[:job_id])
    render json: JobSerializer.new(job), status: 200
  end
  
  def update
    job = Job.find(params[:job_id])
    if job.status == "NOI Requested"
      job.update(status: 3)
    elsif job.status == "NOI Filed"
      job.update(status: 4)
    end
    render json: JobSerializer.new(job), status: 200
  end
end