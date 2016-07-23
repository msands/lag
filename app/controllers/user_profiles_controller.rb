class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_user_profile, only: [:show, :edit, :update]
  skip_before_action :check_profile, only: [:new, :create]

  def index
    @user_profiles = UserProfile.all
  end

  def show
    find_user_profile
  end

  def new
    @user_profile = UserProfile.new
  end

  def edit
    find_user_profile
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user = current_user
    #@user_profile.avatar = @avatar.filename
    if @user_profile.save
      redirect_to my_profile_path, notice: "Profile successfully saved!"
    else
      flash[:error] = "Oops, something went wrong"
      render "new"
    end
  end

  def update
    find_user_profile
    if @user_profile.update_attributes(user_profile_params)
      flash[:success] = "Profile updated"
      redirect_to my_profile_path
    else
      render "edit"
    end
  end

  protected

  def find_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:church, :state, :website, :birthday, :gender, :about, :avatar_id, interests: [], avatar_attributes: [:filename])
  end
end
