require 'sendgrid-ruby'
include SendGrid
include ActionView::Helpers::NumberHelper

class JobCreationEmail
  def send(job)
    from = Email.new(email: 'josh.tukman@gmail.com')
    to = Email.new(email: 'nickedwin85@gmail.com')
    subject = 'This is Sidekiq test'
    content = Content.new(type: 'text/plain', value:
      "A new job located at: #{job.job_site_address} #{job.job_site_city}, #{job.job_site_state} #{job.job_site_zip_code} has been created using Lien Flash.
This job has an unpaid balance of #{number_to_currency(job.total_cost)}.

In 45 days you will be given the option to create a Letter of Intent to File a Lien if payment has not been received.

Thank you for using Lien Flash!


Please do not reply to this email. This is a post-only, outbound email. We will be unable to respond to your reply.
Should you have any questions please reach out to us at: info@lienflash.com
© 2020 Lien Flash. All Rights Reserved.")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
