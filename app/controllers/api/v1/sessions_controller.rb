class Api::V1::SessionsController < ApplicationController

  SECRET_KEY = Rails.application.secrets.secret_key_base

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