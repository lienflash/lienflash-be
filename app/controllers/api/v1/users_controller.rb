class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {"data":{"errors": user.errors.full_messages}}, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :business_name, :email, :business_work_number, :business_cell_number, :business_address, :business_address_line2, :business_city, :business_state, :business_zip_code, :password, :password_confirmation)
  end
end
