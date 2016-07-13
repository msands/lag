class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    find_topic
  end

  def new
    @topic = Topic.new
    @topic.forum_id = params[:forum_id]
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.forum_id = params[:forum_id]
    @topic.save

    if @topic.save
      redirect_to forum_topic_url(id: @topic.id, forum_id: @topic.forum_id)
    else
      render 'new'
    end
  end

  def edit
    find_topic
  end

  def update
    if @topic.update(topic_params)
      flash[:success] = "Topic updated"
      redirect_to forum_topic_path(forum_id: @topic.forum_id)
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  protected

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :message, :forum_id)
  end
end
