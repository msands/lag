class TopicsController < ApplicationController
  before_action :find_topic, except: only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    find_topic
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.forum_id = forum.id
    @topic.save

    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end

  def edit
    find_topic
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
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
    params.require(:topic).permit(:name, :description)
  end
end
