class Job < ApplicationRecord

  validates :job_street, presence: true
  validates :job_city, presence: true
  validates :job_state, presence: true
  validates :job_zip, presence: true
  validates :date_of_completion, presence: true
  # validates :company_name
  # validates :contact_name
  # validates :material_cost
  # validates :labor_cost
  # validates :job_description
  # validates :job_id

  # for future update
  # belongs_to :user
end
