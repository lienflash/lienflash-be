require 'date'
class Job < ApplicationRecord
  before_validation :default_date, :default_status

  validates :job_type, presence: true
  validates :job_site_contact_name, presence: true
  validates :job_site_address, presence: true
  validates :job_site_city, presence: true
  validates :job_site_state, presence: true
  validates :job_site_zip_code, presence: true
  validates :completion_date, presence: true
  validates :description_of_work, presence: true
  validates :total_cost, presence: true
  enum status: { "Good Standing": 0, "NOI Eligible": 1, "NOI Requested": 2, "NOI Filed": 3, "Lien Filed": 4, "Inactive": 5}

  belongs_to :user

  def default_date
    self.completion_date ||= Time.current
  end

  def default_status
    self.status ||= 0
  end

  def days_outstanding
    today = Date.current
    date_time = Date.parse("#{self.completion_date}")
    (today - date_time).to_i
  end

  def late?
    days_outstanding >= 10
  end

  def first_notice?
    if self.job_type == "Materials & Labor"
      days_outstanding == 45
    else
      days_outstanding == 30
    end
  end

  def second_notice?
    if self.job_type == "Materials & Labor"
      days_outstanding == 75
    else
      days_outstanding == 45
    end
  end

  def third_notice?
    if self.job_type == "Materials & Labor"
      days_outstanding == 90
    end
  end

  def fourth_notice?
    if self.job_type == "Materials & Labor"
      days_outstanding == 100
    end
  end

  def final_notice?
    if self.job_type == "Materials & Labor"
      days_outstanding == 105
    else
      days_outstanding == 47
    end
  end

  def expired?
    if self.job_type == "Materials & Labor"
      days_outstanding >= 110
    else
      days_outstanding >= 50
    end
  end

  def status_of_NOI_eligible?
    self.status == "NOI Eligible"
  end

  def status_update
    job = Job.find(self.id)
    if job.late? && job.status == "Good Standing"
      job.status = 1
    elsif job.expired? && job.status_of_NOI_eligible?
      job.status = 5
    end
    job.save
  end

  def notifications
    job = Job.find(self.id)
    user = User.find(job.user_id)
    if job.status_of_NOI_eligible? && job.first_notice?
      if job_type == "Materials & Labor"
        UserNotifierMailer.send_first_notice_email(job, user).deliver_now
      else
        UserNotifierMailer.send_just_labor_first_notice_email(job, user).deliver_now
      end 
      CustomerText.new.job_text_notification(job)
    elsif job.status_of_NOI_eligible? && job.second_notice?
      if job.job_type == "Materials & Labor"
        UserNotifierMailer.send_second_notice_email(job, user).deliver_now
      else
        UserNotifierMailer.send_just_labor_second_notice_email(job, user).deliver_now
      end
      CustomerText.new.job_text_notification(job)
    elsif job.status_of_NOI_eligible? && third_notice?
      UserNotifierMailer.send_third_notice_email(job, user).deliver_now
      CustomerText.new.job_text_notification(job)
    elsif job.status_of_NOI_eligible? && fourth_notice?
      UserNotifierMailer.send_fourth_notice_email(job, user).deliver_now
      CustomerText.new.job_text_notification(job)
    elsif job.status_of_NOI_eligible? && final_notice?
      UserNotifierMailer.send_final_notice_email(job, user).deliver_now
      CustomerText.new.final_text_notification(job)
    end
  end
end
