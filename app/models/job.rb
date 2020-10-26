require 'date'
class Job < ApplicationRecord

  validates :job_street, presence: true
  validates :job_city, presence: true
  validates :job_state, presence: true
  validates :job_zip, presence: true
  validates :date_of_completion, presence: true
  enum status: { "good standing": 0, "NOI Eligible": 1, "NOI filed": 2, "Lien Filed": 3, "inactive": 4}

  def days_outstanding
    today = Date.today
    date_time = DateTime.parse("#{self.date_of_completion}")
    (today - date_time).to_i
  end

  def late?
    days_outstanding > 30
  end

  def status_update
    if self.late? 
      self.status = 1
    end 
  end 
  # validates :company_name
  # validates :contact_name
  # validates :material_cost
  # validates :labor_cost
  # validates :job_description
  # validates :job_id

  # for future update
  # belongs_to :user
end
