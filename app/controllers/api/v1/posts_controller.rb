module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only:[:show, :update, :destroy]
      skip_before_action :verify_authenticity_token#動作確認用
    
      def index
        @q = Post.ransack(title_or_tags_name_cont: params[:q])
        @posts = @q.result(distinct: true)
        render json: { status: 'SUCCESS', message: 'Loaded posts', post_data: @posts }
      end 
    
      def show
        render json: { status: 'SUCCESS', message: 'Loaded the post', post_data: @post }
      end

      def search
        @q = Post.ransack(title_or_tags_name_cont: params[:q])
        @posts = @q.result(distinct: true)
        render json: { status: 'SUCCESS', message: 'Loaded posts', post_data: @posts }
      end

      def creat
        @post = Post.new(post_params)
        @user = @post.user
        if @post.save
          render json: { status: 'SUCCESS', post_data: @post, user_data: @user }
        else
          render json: { status: 'ERROR', post_data: post.errors }
        end
      end

      def update
        if @post.update(post_params)
          render json: { status: 'SUCCESS', message: 'Updated the post', post_data: @post }
        else
          render json: { status: 'ERROR', message: 'Not updated', post_data: @post.errors }
        end
      end
    
      def destroy
        @post.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post'}
      end
    
      def post_params
        params.require(:post).permit(:content, :title, :user_id)
      end

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
