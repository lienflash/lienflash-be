class Api::V1::Admin::BaseController < ApplicationController
  #before_action :require_admin
  
  private

  # def require_admin
  #   render file: "/public/404" unless current_admin?
  # end
end