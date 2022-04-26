class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.format_data(user)
    else
      bad_credentials
    end
  end

private 
  def bad_credentials
    render json: { data: { message: 'Invalid Email/Password' } }, status: 401
  end
end 