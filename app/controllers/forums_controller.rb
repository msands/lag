class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @forums = Forum.all
  end

  def show
    find_forum
    @topics = @forum.topics(params[:id])
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user_id = current_user.id
    @forum.save

    if @forum.save
      redirect_to @forum
    else
      render 'new'
    end
  end

  def edit
    find_forum
  end

  def update
    if @forum.update(forum_params)
      redirect_to @forum
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to forums_path
  end

  protected

  def find_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:name, :description)
  end
end
