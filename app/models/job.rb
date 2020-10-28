require 'date'
class Job < ApplicationRecord

  validates :job_type, presence: true
  validates :job_site_contact_name, presence: true
  validates :job_site_name, presence: true
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

  def second_notice
  end

  def late?
    days_outstanding == 45
  end

  def status_update
    if self.late?
      self.status = 1
    end
  end
end
