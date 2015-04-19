class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Post was favorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error favoriting the post. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    if favorite.destroy
     flash[:notice] = "You have un-favourited this post"
      redirect_to [post.topic, post]
    else
     flash[:notice] = "There was an error un-favouriting this post. Please try again"
      redirect_to [post.topic, post]
    end
  end
end
