# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 =  User.create(
          name: "Timmy",
          business_name: "Timmy's plumbing",
          email: "josh.tukman@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "7203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        )
job1 = Job.create(
        job_type: "Labor",
        job_site_contact_name: "Tim",
        job_site_name: "Job Site",
        job_site_address: "123 Main St.",
        job_site_city: "Denver",
        job_site_state: "CO",
        job_site_zip_code: "80218",
        completion_date: "2020-10-20T04:05:06+00:00",
        description_of_work: "We fixed a toilet",
        labor_cost: 100.00,
        material_cost: 150.00,
        total_cost: 250.00,
        user_id: user1.id
      )
job2 = Job.create(
        job_type: "Labor",
        job_site_contact_name: "Tim",
        job_site_name: "Job Site",
        job_site_address: "1234 Street St.",
        job_site_city: "Denver",
        job_site_state: "CO",
        job_site_zip_code: "80218",
        completion_date: "2020-10-20T04:05:06+00:00",
        description_of_work: "We fixed a shower",
        labor_cost: 200.00,
        material_cost: 150.00,
        total_cost: 350.00,
        user_id: user1.id
      )
