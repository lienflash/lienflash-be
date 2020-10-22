require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :job_street }
    it { should validate_presence_of :job_city }
    it { should validate_presence_of :job_state }
    it { should validate_presence_of :job_zip }
    it { should validate_presence_of :date_of_completion }
    # it { should validate_presence_of :company_name }
    # it { should validate_presence_of :contact_name }
    # it { should validate_presence_of :material_cost }
    # it { should validate_presence_of :labor_cost }
    # it { should validate_presence_of :job_description }
    # it { should validate_presence_of :job_id }
  end

  # when user table is created
  # describe 'relationships' do
  #   it { should belong_to :user }
  # end
end
