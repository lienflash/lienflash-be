class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :job_street
      t.string :job_city
      t.string :job_state
      t.string :job_zip
      t.string :company_name
      t.string :contact_name
      t.datetime :date_of_completion
      t.float :material_cost
      t.float :labor_cost
      t.text :job_description
      t.string :job_id
      t.timestamps
    end
  end
end
