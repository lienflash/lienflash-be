class Api::V1::JobsController < ApplicationController

  def index
    render json: JobSerializer.new(Job.all)
  end

  def show
    render json: JobSerializer.new(Job.find(params[:id]))
  end

  def create
    job = Job.new(job_params)
    user = User.find(job.user_id)
    if job.save
      UserNotifierMailer.send_job_creation_email(job, user).deliver_now
      render json: JobSerializer.new(job), status: 201
      CustomerText.new.job_creation(job)
    else
      render json: {"data":{"errors": job.errors.full_messages}}, status: 400
    end
  end

  def update
    job = Job.find(params[:id])
    if params[:status] == "5"
      job.status = "Inactive"
    elsif params[:status] == "2"
      job.status = "NOI Requested"
    else
      job.status_update
    end
    job.save
    render json: JobSerializer.new(job), status: 200
  end

  private

  def job_params
    params.permit(:job_type, :job_site_contact_name, :job_site_name, :job_site_address, :job_site_address_line_2, :job_site_city, :job_site_state, :job_site_zip_code, :completion_date, :description_of_work, :material_cost, :labor_cost, :total_cost, :client_company_name, :business_address, :business_address_line_2, :business_city, :business_state, :business_zip_code, :additional_info, :status, :user_id)
  end
end
