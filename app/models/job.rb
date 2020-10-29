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
    date_time = DateTime.parse("#{self.date_of_completion}")
    (today - date_time).to_i
  end

  def late?
    days_outstanding >= 45
  end

  def second_notice
    days_outstanding == 75
  end

  def third_notice
    days_outstanding == 90
  end

  def fourth_notice
    days_outstanding == 100
  end

  def final_notice
    days_outstanding == 105
  end

  def expire
    days_outstanding > 110
  end

  def status_update
    if self.late? && self.status == 0
      self.status = 1
      FirstNoticeEmail.new.send(self)
    elsif self.second_notice && self.status != 2 && self.status != 3 && self.status != 4
      SecondNoticeEmail.new.send(self)
    elsif self.third_notice && self.status != 2 && self.status != 3 && self.status != 4
      ThirdNoticeEmail.new.send(self)
    elsif self.fourth_notice && self.status != 2 && self.status != 3 && self.status != 4
      FourthNoticeEmail.new.send(self)
    elsif self.final_notice && self.status != 2 && self.status != 3 && self.status != 4
      FinalNoticeEmail.new.send(self)
    elsif self.expire
      self.status = 4
    end
  end
end
