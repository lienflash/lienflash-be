FactoryBot.define do
  factory :job do
    job_type { "Materials & Labor" }
    sequence(:job_site_contact_name) { |n| "Contact #{n}" }
    sequence(:job_site_name) { |n| "Name #{n}" }
    job_site_address { Faker::Address.street_address }
    job_site_city { Faker::Address.city }
    job_site_state { Faker::Address.state_abbr }
    job_site_zip_code { Faker::Address.zip }
    completion_date { 45.days.ago }
    description_of_work { Faker::Lorem.sentence }
    sequence(:labor_cost) { |n| n }
    sequence(:material_cost) { |n| ("#{n}".to_i)*2 }
    sequence(:total_cost) { |n| ("#{n}".to_i)*3 }
    status { 0 }
  end

  factory :user do
  name { Faker::Name.name }
  business_name { Faker::App.name }
  email { Faker::Internet.email }
  business_cell_number { Faker::PhoneNumber.cell_phone }
  business_address { Faker::Address.street_address }
  business_city { Faker::Address.city }
  business_state { Faker::Address.state_abbr }
  business_zip_code { Faker::Address.zip }
  password { Faker::Games::DnD.klass }
  end
end
