class UsersController < ApplicationController

  def index
    @invitations = current_user.pending_invitations.all
  end

  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.all
    #to get the count of pending requests
    @friends_list = @user.friends
    @post = Post.new
    redirect_back(fallback_location: root_path) if @post.save
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end

end
