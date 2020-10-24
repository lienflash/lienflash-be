class JobSerializer
  include FastJsonapi::ObjectSerializer

  attributes :job_street, :job_city, :job_state, :job_zip, :date_of_completion, :company_name, :contact_name, :material_cost, :labor_cost, :job_description, :job_id
end
