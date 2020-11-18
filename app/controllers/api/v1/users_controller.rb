class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:show]
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token({user_id: user.id})
      render json: UserSerializer.new(user, {params: {token: token}}), status: 201
    else
      render json: {"data":{"errors": user.errors.full_messages}}, status: 400
    end
  end

  def login
    if user = User.find_by_email(user_params[:email])
      if user.authenticate(user_params[:password])
        token = encode_token({user_id: user.id})
        #session[:user_id] = user.id
        render json: UserSerializer.new(user, {params: {token: token}}), status: 200
      else
        render json: {"data":{"errors": "Invalid credentials"}}, status: 401
      end
    else
      render json: {"data":{"errors": "Invalid credentials"}}, status: 401
    end
  end

  # def auto_login
  #   render json: @user
  # end

  def show
    user = User.find(params[:id])
    token = encode_token({user_id: user.id})
    render json: UserSerializer.new(user, {params: {token: token}}), status: 200
  end

  private

  def user_params
    params.permit(:name, :business_name, :email, :business_work_number, :business_cell_number, :business_address, :business_address_line2, :business_city, :business_state, :business_zip_code, :password, :password_confirmation, :id)
  end
end
