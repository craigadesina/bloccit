class CommentsController < ApplicationController
  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
      else
      flash[:error] = "There was an error saving the comment. Coments should have at least 5 characters. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    #@topic = Topic.find(params[:topic_id])
    #@post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
 
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      #redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      #redirect_to [@topic, @post]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
