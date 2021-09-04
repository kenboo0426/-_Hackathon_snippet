module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate!, only: %i[show]
      protect_from_forgery with: :null_session
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        user = User.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded user', data: user }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the user', data: @user }
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'SUCCESS', data: user }
        else
          render json: { status: 'ERROR', data: user.errors }
        end
      end

      def destroy
        @user.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the user', data: @user }
      end

      def update
        if @user.update(user_params)
          render json: { status: 'SUCCESS', message: 'Updated the user', data: @user }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @user.errors }
        end
      end

      def current_user
        return @current_user if @current_user
        return unless bearer_token
    
        payload = User.decode bearer_token
        @current_user ||= User.find_by(id: payload[0]['user_id'])
      end
    
      def authenticate!
        return if current_user
    
        head :unauthorized
      end
    
      def bearer_token
        header = request.headers['Authorization']

        header.gsub(/^Bearer /, '') if header&.match(/^Bearer /)
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        # params.permit(:name, :email, :password)
        params.permit( :name, :email, :password, :password_confirmation)
      end
    end
  end
end