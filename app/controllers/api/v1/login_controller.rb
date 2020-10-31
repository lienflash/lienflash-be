class Api::V1::LoginController < ApplicationController
  def create
    if user = User.find_by_email(user_params[:email])
      if user.authenticate(user_params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.new(user), status: 200
      else
        render json: {"data":{"errors": "Invalid credentials"}}, status: 401
      end
    else
      render json: {"data":{"errors": "Invalid credentials"}}, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
