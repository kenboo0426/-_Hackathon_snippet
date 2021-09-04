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

  def create_tokens
    expires_in = 1.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    payload = { user_id: id }
    issue_token(payload.merge(exp: expires_in))
  end

  private

    def issue_token(payload)
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end
end