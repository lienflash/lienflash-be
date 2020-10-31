class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :business_name, :email, :business_work_number, :business_cell_number, :business_address, :business_address_line2, :business_city, :business_state, :business_zip_code
end
