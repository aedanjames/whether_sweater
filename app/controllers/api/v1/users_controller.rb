class Api::V1::UsersController < ApplicationController
  binding.pry
  def index 
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
    else 
    render status: 404
    end 
  end 

private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end 