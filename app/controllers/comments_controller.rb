class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to forum_topic_url(id: @topic.id, forum_id: @topic.forum_id)
    else
      render 'new'
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end
end
