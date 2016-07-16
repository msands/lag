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

  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to forum_topic_url(id: @topic.id, forum_id: @topic.forum_id)
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to forum_topic_url(id: @topic.id, forum_id: @topic.forum_id)
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end
end
