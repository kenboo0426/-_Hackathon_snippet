module Api
  module V1
    class LikesController < ApplicationController
      before_action :set_post, only:[:create, :destroy]
      before_action :set_user, only:[:index, :create]
        
      def index
        @posts = @user.posts
        render json: { status: 'SUCCESS', message: 'Loaded posts', post_data: @posts }
      end

      def create
        @like = Like.new(user_id: @user.id, post_id: @post.id)
        if @like.save
            render json: { status: 'SUCCESS', post_data: @post, user_data: @user }
        else
            render json: { status: 'ERROR', like_data: @like.errors }
        end

      end

      def destroy
        @like = Like.find_by(post_id: @post.id)
        @like.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the like'}
      end

      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_user
        @user = User.find(params[:user_id])
      end
    
    end
  end
    

end
