class Api::V1::SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password]) 

    if user
      token = user.create_tokens
      render json: { token: token }
    else
      head :Unauthorized
    end
  end
end