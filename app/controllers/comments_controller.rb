class CommentsController < ApplicationController
    before_action :set_comment, only: [:update, :destroy, :show]
    before_action :authenticate_request
 
   def create
     comment = Comment.new(post_params)
     if comment.save
       render json: comment, status: :created
     else
       render json: comment.errors, status: :unprocessable_entity
     end
   end
 
   def update  
     if @comment.update(comment_params)
       render json: @comment, status: :ok
     else
       render json: @comment.errors, status: :unprocessable_entity
     end
   end
 
   def destroy
     if @comment.destroy
       render json: @comment.errors, status: :unprocessable_entity
   end
   
   private
 
   def set_comment
     @comment = Comment.find(params[:id])
   end
 
   def comment_params
     params.permit(:body, :user_id, :post_id)
   end
end
