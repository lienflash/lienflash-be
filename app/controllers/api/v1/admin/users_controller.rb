class Api::V1::Admin::UsersController < Api::V1::Admin::BaseController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
end
