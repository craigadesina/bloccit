class PostsController < ApplicationController

before_action :flash_attack

skip_before_action :flash_attack, only: [:index, :new]

 def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    authorize @post
  @post = current_user.posts.build(params.require(:post).permit(:title, :body))
  authorize @post
       if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end
  def update
    authorize @post
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  def edit
    authorize @post
    @post = Post.find(params[:id])
  end
end