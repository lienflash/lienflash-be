require 'date'
class Job < ApplicationRecord
  before_validation :default_date, :default_status

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
  validates :labor_cost, presence: true
  validates :material_cost, presence: true
  validates :total_cost, presence: true
  # validates :client_company_name
  # validates :business_address
  # validates :business_address_line_2
  # validates :business_city
  # validates :business_state
  # validates :business_zip_code
  # validates :additional_info
  enum status: { "good standing": 0, "NOI Eligible": 1, "NOI filed": 2, "Lien Filed": 3, "inactive": 4}

  def default_date
    self.completion_date ||= DateTime.now
  end

  def default_status
    self.status ||= 0
  end

  def days_outstanding
    today = Date.today
    # date_time = DateTime.parse("#{self.completion_date}")
    # (today - date_time).to_i
    (today - self.completion_date.to_date).to_i
  end

  def second_notice
  end

  def late?
    days_outstanding >= 45
  end

  def status_update
    job = Job.find(self.id)
    if job.late? && job.status == "good standing"
      job.status = "NOI Eligible"
      job.save
      # self.save
    end
  end
end
