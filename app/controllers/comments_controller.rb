class CommentsController < ApplicationController
  def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: "Answer created successfully!"
    else
      render "posts/show"
    end
  end
  #
  # def edit
  #
  # end
  #
  # def update
  #
  # end
  #
  def destroy
    comment = Comment.find params[:id]
    # redirect_to root_path, alert: "Aceess Denied!" unless can?(:destroy, comment)
    comment.destroy
    redirect_to post_path(comment.post), notice: "Comment deleted!"
  end
end
