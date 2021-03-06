class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      return email_taken if user.errors.messages[:email] == ["has already been taken"]
      if user.save
        render json: UserSerializer.format_data(user), status: 201
      end 
    else 
      return bad_credentials
    end 
  end 

private 

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end

  def bad_credentials
    render json: { data: { message: 'Invalid Email/Password' } }, status: 401
  end

  def email_taken
    render json: { data: { message: 'Email has already been taken' } }, status: 401
  end
end 