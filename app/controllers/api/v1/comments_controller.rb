module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post
      before_action :set_user
      before_action :set_comment, only: [:update, :destroy]

      def index
        comments = @post.comments if @post
        comments = @user.comments if @user
        render json: { status: 'SUCCESS', data: comments }
      end

      def create
        comment = @post.comments.new(user_id: params[:user_id], comment: params[:comment])
        if comment.save
          render json: { status: 'SUCCESS', data: comment }
        else
          render json: { status: 'ERROR', data: comment.errors }
        end
      end

      def destroy
        @comment.destroy
        render json: { status: 'SUCCESS', data: @comment }
      end

      def update
        if @comment.update(comment: params[:comment])
          render json: { status: 'SUCCESS', data: @comment }
        else
          render json: { status: 'SUCCESS', data: @comment.errors }
        end
      end

      private

        def set_post
          return unless params[:post_id]
          @post = Post.find_by(id: params[:post_id])
        end

        def set_user
          return unless params[:user_id]
          @user = User.find_by(id: params[:user_id])
        end

        def set_comment
          @comment = Comment.find_by(id: params[:id])
        end

    end
  end
end