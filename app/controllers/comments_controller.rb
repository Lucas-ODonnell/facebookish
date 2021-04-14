class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def edit 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  def vote
    #Need comment_id for the vote db
    @comment = Comment.find(params[:comment_id])
    if !current_user.liked? @comment
      @comment.liked_by current_user
    elsif current_user.liked? @comment
      @comment.unliked_by current_user
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :body, :comment_image, :post_id, :user_id)
  end

end
