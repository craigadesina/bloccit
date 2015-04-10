class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
      else
      flash[:error] = "There was an error saving the comment. Coments should have at least 5 characters. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
