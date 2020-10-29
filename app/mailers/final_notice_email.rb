require 'sendgrid-ruby'
include SendGrid
include ActionView::Helpers::NumberHelper

class FinalNoticeEmail
  def send(job)
    from = Email.new(email: 'josh.tukman@gmail.com')
    to = Email.new(email: 'nickedwin85@gmail.com')
    subject = "Today is the last day to file a NOI with Lien Flash"
    content = Content.new(type: 'text/plain', value:
      "The job located at: #{job.job_site_address} #{job.job_site_city}, #{job.job_site_state} #{job.job_site_zip_code} has been unpaid for 105 days.
This job has an unpaid balance of #{number_to_currency(job.total_cost)}.

Would you like us to proceed with filing a Notice of Intent to file a lien?
If so please click here: **link to send to jason with account info and job info for him to reach out, and thank you page on the**

This is your last day to file a Notice of Intent to file a lien. If you do not file today you lose your rights to receive payment for this job.

If you have received payment on this job already, please click *here* to stop these notifications and close this job on Lien Flash.

Thank you for using Lien Flash!


Please do not reply to this email. This is a post-only, outbound email. We will be unable to respond to your reply.
Should you have any questions please reach out to us at: info@lienflash.com
© 2020 Lien Flash. All Rights Reserved.")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
