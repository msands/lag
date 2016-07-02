class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update, :destroy]

  def index
    @forums = Forum.all
  end

  def show
    find_forum
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
  end

  def update
  end

  def destroy
  end

  protected

  def find_forum
    @form = Forum.find(params[:id])
  end

  def forums_params
    params.require(:forum).permit(:title, :description)
end
