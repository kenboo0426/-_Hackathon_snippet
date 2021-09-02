module Api
  module V1
    class UsersController < ApplicationController
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

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end