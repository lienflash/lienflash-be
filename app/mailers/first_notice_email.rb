require 'sendgrid-ruby'
include SendGrid
include ActionView::Helpers::NumberHelper

class FirstNoticeEmail
  def send(job)
    from = Email.new(email: 'josh.tukman@gmail.com')
    to = Email.new(email: 'josh.tukman@gmail.com')
    subject = "A job on Lien Flash requires your attention"
    content = Content.new(type: 'text/plain', value:
      "The job located at: #{job.job_site_address} #{job.job_site_city}, #{job.job_site_state} #{job.job_site_zip_code} has been unpaid for 45 days.
This job has an unpaid balance of #{number_to_currency(job.total_cost)}.

Would you like us to proceed with filing a Notice of Intent to file a lien?
If so please click here: **link to send to jason with account info and job info for him to reach out, and thank you page on the**

If not you will be reminded again in 30 days.
*Please note, there are 60 days remaining to file this NOI. If that time elapses you will lose the right to file a lien.

If you have received payment on this job already, please click here to stop these notifications and close this job on Lien Flash.

Thank you for using Lien Flash!


Please do not reply to this email. This is a post-only, outbound email. We will be unable to respond to your reply.
Should you have any questions please reach out to us at: info@lienflash.com
© 2020 Lien Flash. All Rights Reserved.")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
