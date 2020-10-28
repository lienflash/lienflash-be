# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_22_212049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "job_type"
    t.string "job_site_contact_name"
    t.string "job_site_name"
    t.string "job_site_address"
    t.string "job_site_address_line_2"
    t.string "job_site_city"
    t.string "job_site_state"
    t.string "job_site_zip_code"
    t.datetime "completion_date"
    t.text "description_of_work"
    t.float "labor_cost"
    t.float "material_cost"
    t.float "total_cost"
    t.string "client_company_name"
    t.string "business_address"
    t.string "business_address_line_2"
    t.string "business_city"
    t.string "business_state"
    t.string "business_zip_code"
    t.text "additional_info"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
