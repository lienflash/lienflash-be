# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
job1 = Job.create(
        job_street: "123 Main St.",
        job_city: "Denver",
        job_state: "Co",
        job_zip: "80218",
        date_of_completion: "2020-01-01T04:05:06+00:00",
        company_name: "Construction Co Inc LLC",
        contact_name: "Timmy Tim Tim",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "We fixed some stuff.",
        job_id: "ABC123"
      )
job2 = Job.create(
        job_street: "2nd Location St.",
        job_city: "Boulder",
        job_state: "Co",
        job_zip: "80309",
        date_of_completion: "2020-10-20T04:05:06+00:00",
        company_name: "Construction Co Inc LLC",
        contact_name: "Josh T",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "We fixed some different stuff.",
        job_id: "ABC124"
      )