class JobSerializer
  include FastJsonapi::ObjectSerializer

  attributes :job_type, :job_site_contact_name, :job_site_name, :job_site_address, :job_site_address_line_2, :job_site_city, :job_site_state, :job_site_zip_code, :completion_date, :description_of_work, :labor_cost, :material_cost, :total_cost, :client_company_name, :business_address, :business_address_line_2, :business_city, :business_state, :business_zip_code, :additional_info, :status, :user_id
end
