FactoryBot.define do
  factory :job do
    job_type { "Roofing" }
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
end
