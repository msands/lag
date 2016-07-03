class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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

  def forum_params
    params.require(:forum).permit(:name, :description)
  end
end
