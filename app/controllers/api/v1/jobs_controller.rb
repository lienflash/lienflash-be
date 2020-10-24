require 'sendgrid-ruby'
include SendGrid

class Api::V1::JobsController < ApplicationController
  def create
    job = Job.new(
      job_street: job_params[:job_street],
      job_city: job_params[:job_city],
      job_state: job_params[:job_state],
      job_zip: job_params[:job_zip],
      date_of_completion: job_params[:date_of_completion],
      company_name: job_params[:company_name],
      contact_name: job_params[:contact_name],
      material_cost: job_params[:material_cost],
      labor_cost: job_params[:labor_cost],
      job_description: job_params[:job_description],
      job_id: job_params[:job_id],
      )

    if job.save
      render json: JobSerializer.new(job), status: 201

      from = Email.new(email: 'josh.tukman@gmail.com')
      to = Email.new(email: 'nickedwin85@gmail.com')
      subject = 'A new job has been created with Lien Flash'
      content = Content.new(type: 'text/plain', value:
        "A new job located at: #{job.job_street} #{job.job_city} #{job.job_state}, #{job.job_zip} has been created using Lien Flash.
This job has an unpaid balance of $#{job.material_cost + job.labor_cost}.
In 60 days you will be given the option to create a Letter of Intent to File a Lien.

Thank you for using Lien Flash!

Please do not reply to this email. This is a post-only, outbound email. We will be unable to respond to your reply.
Should you have any questions please reach out to us at: info@lienflash.com
© 2020 Lien Flash. All Rights Reserved.")
      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
    else
      render json: {"data":{"errors": job.errors.full_messages}}, status: 400
    end
  end

  private

  def job_params
    params.permit(:job_street, :job_city, :job_state, :job_zip, :date_of_completion, :company_name, :contact_name, :material_cost, :labor_cost, :job_description, :job_id)
  end
end
