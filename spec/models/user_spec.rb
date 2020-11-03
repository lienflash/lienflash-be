require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :business_name }
    it { should validate_presence_of :email }
    # it { should validate_presence_of :business_work_number }
    it { should validate_presence_of :business_cell_number }
    it { should validate_presence_of :business_address }
    # it { should validate_presence_of :business_address_line2 }
    it { should validate_presence_of :business_city }
    it { should validate_presence_of :business_state }
    it { should validate_presence_of :business_zip_code }
    it { should validate_presence_of :password }
  end

  describe 'relationships' do
    it { should have_many :jobs }
  end
end
