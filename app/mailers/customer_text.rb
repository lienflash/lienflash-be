require 'twilio-ruby'

class CustomerText

  def job_creation(job)
    to = find_phone(job)
    sms_body = "A new job has been created using Lien Flash."
    TwilioService.send_msg(to, sms_body)
  end

  def job_text_notification(job)
    to = find_phone(job)
    sms_body = "A job in Lien Flash requires your attention."
    TwilioService.send_msg(to, sms_body)
  end

  def final_text_notification(job)
    to = find_phone(job)
    sms_body = "A job in Lien Flash desperately requires your attention."
    TwilioService.send_msg(to, sms_body)
  end

  private

  def find_phone(job)
    job.user.business_cell_number
  end
end
