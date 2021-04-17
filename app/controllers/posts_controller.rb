class PostsController < ApplicationController
  respond_to :js, :json, :html
  before_action :authenticate_user!
  def index
    @posts = Post.where(user_id: current_user).or(Post.where(user_id: current_user.friends)).with_attached_images.order("created_at DESC")
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def vote
    #Like function
    @post = Post.find(params[:post_id])
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end


  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
