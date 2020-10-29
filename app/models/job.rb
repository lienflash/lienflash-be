require 'date'
class Job < ApplicationRecord

  validates :job_type, presence: true
  validates :job_site_contact_name, presence: true
  # validates :job_site_name
  validates :job_site_address, presence: true
  # validates :job_site_address_line_2
  validates :job_site_city, presence: true
  validates :job_site_state, presence: true
  validates :job_site_zip_code, presence: true
  validates :completion_date, presence: true
  validates :description_of_work, presence: true
  #validates :labor_cost
  #validates :material_cost
  validates :total_cost, presence: true
  # validates :client_company_name
  # validates :business_address
  # validates :business_address_line_2
  # validates :business_city
  # validates :business_state
  # validates :business_zip_code
  # validates :additional_info
  enum status: { "good standing": 0, "NOI Eligible": 1, "NOI filed": 2, "Lien Filed": 3, "inactive": 4}

  def days_outstanding
    today = Date.today
    date_time = DateTime.parse("#{self.completion_date}")
    (today - date_time).to_i
  end

  def late?
    if self.job_type == "Materials & Labor"
      days_outstanding >= 45
    else
      days_outstanding >= 30
    end
  end

  def second_notice
    if self.job_type == "Materials & Labor"
      days_outstanding == 75
    else
      days_outstanding == 45
    end
  end

  def third_notice
    if self.job_type == "Materials & Labor"
      days_outstanding == 90
    end
  end

  def fourth_notice
    if self.job_type == "Materials & Labor"
      days_outstanding == 100
    end
  end

  def final_notice
    if self.job_type == "Materials & Labor"
      days_outstanding == 105
    else
      days_outstanding == 47
    end
  end

  def expire
    if self.job_type == "Materials & Labor"
      days_outstanding > 110
    else
      days_outstanding > 50 
    end
  end

  def status_update
    job = Job.find(self.id)
    if job.late? && job.status == "good standing" 
      job.status = "NOI Eligible"
      job.save
      #FirstNoticeEmail.new.send(self) if self.job_type == "Materials & Labor"
      #JustLaborFirstNoticeEmail.new.send(self) if self.job_type == "Labor"
      #CustomerText.new.job_text_notification
    elsif self.second_notice && self.status != 2 && self.status != 3 && self.status != 4
      SecondNoticeEmail.new.send(self) if self.job_type == "Materials & Labor"
      JustLaborSecondNoticeEmail.new.send(self) if self.job_type == "Labor"
      CustomerText.new.job_text_notification
    elsif self.third_notice && self.status != 2 && self.status != 3 && self.status != 4
      ThirdNoticeEmail.new.send(self)
      CustomerText.new.job_text_notification
    elsif self.fourth_notice && self.status != 2 && self.status != 3 && self.status != 4
      FourthNoticeEmail.new.send(self)
      CustomerText.new.job_text_notification
    elsif self.final_notice && self.status != 2 && self.status != 3 && self.status != 4
      FinalNoticeEmail.new.send(self)
      CustomerText.new.final_text_notification
    elsif self.expire && self.status != 2 && self.status != 3
      self.status = 4
    end
  end
end
