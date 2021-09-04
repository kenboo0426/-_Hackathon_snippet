module Api::UserAuthenticator
  extend ActiveSupport::Concern

  def current_user
    return @current_user if @current_user
    return unless bearer_token

    payload, = User.decode bearer_token
    @current_user ||= User.find_by(id: payload['user_id'])
  end

  def authenticate!
    return if current_user

    head :unauthorized
  end

  def bearer_token
    header = request.headers['Authorization']

    header.gsub(/^Bearer /, '') if header&.match(/^Bearer /)
  end
end