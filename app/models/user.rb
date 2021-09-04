class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def create_tokens
    expires_in = 1.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    payload = { user_id: id }
    issue_token(payload.merge(exp: expires_in))
  end

  def decode(token)
    JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
  end

  private

    def issue_token(payload)
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end

end
