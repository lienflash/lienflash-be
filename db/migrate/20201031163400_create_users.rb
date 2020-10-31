class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :business_name
      t.string :email
      t.string :business_work_number
      t.string :business_cell_number
      t.string :business_address
      t.string :business_address_line2
      t.string :business_city
      t.string :business_state
      t.string :business_zip_code
      t.string :password_digest
      t.timestamps
    end
  end
end
