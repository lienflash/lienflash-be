class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :job_type
      t.string :job_site_contact_name
      t.string :job_site_name
      t.string :job_site_address
      t.string :job_site_address_line_2
      t.string :job_site_city
      t.string :job_site_state
      t.string :job_site_zip_code
      t.datetime :completion_date
      t.text :description_of_work
      t.float :labor_cost
      t.float :material_cost
      t.float :total_cost
      t.string :client_company_name
      t.string :business_address
      t.string :business_address_line_2
      t.string :business_city
      t.string :business_state
      t.string :business_zip_code
      t.text :additional_info
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
