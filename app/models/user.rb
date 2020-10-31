class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :business_name, presence: true
  # validates :business_work_number
  validates :business_cell_number, presence: true
  validates :business_address, presence: true
  # validates :business_address_line2
  validates :business_city, presence: true
  validates :business_state, presence: true
  validates :business_zip_code, presence: true
  validates_presence_of :password, require: true

  has_secure_password
  # has_many :jobs 
end
