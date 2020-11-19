class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController
  before_action :admin? && :authorized
  def index
    users = User.all
    render json: UserSerializer.new(users), status: 200
  end
  
  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user), status: 200
  end

  def delete
    user = User.find(params[:id])
    user.delete
    render status: 204
  end
end
