class Api::V1::JobsController < ApplicationController

  def index
    render json: JobSerializer.new(Job.all)
  end

  def show
    render json: JobSerializer.new(Job.find(params[:id]))
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: JobSerializer.new(job), status: 201
      # JobCreationEmail.new.send(job)
      # CustomerText.new.job_creation
    else
      render json: {"data":{"errors": job.errors.full_messages}}, status: 400
    end
  end

  def update
    job = Job.find(params[:id])
    if params[:status] == "4" 
      job.status = 4
    else
      job.status_update
    end 
    render json: JobSerializer.new(job), status: 200
  end

  private

  def job_params
    params.permit(:job_type, :job_site_contact_name, :job_site_name, :job_site_address, :job_site_address_line_2, :job_site_city, :job_site_state, :job_site_zip_code, :completion_date, :description_of_work, :material_cost, :labor_cost, :total_cost, :client_company_name, :business_address, :business_address_line_2, :business_city, :business_state, :business_zip_code, :additional_info, :status)
  end
end
