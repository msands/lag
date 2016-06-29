class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: :index
  skip_before_action :check_profile, only: [:new, :create]

  def index
    @user_profiles = UserProfile.all
  end

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def new
    @user_profile = UserProfile.new
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user = current_user
    if @user_profile.save
      redirect_to my_profiles_path, notice: "Profile successfully saved!"
    else
      flash[:error] = "Oops, something went wrong"
      render "new"
    end
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update_attributes(user_profile_params)
      flash[:success] = "Profile updated"
      redirect_to my_profiles_path
    else
      render "edit"
    end
  end

  protected

  def user_profile_params
    params.require(:user_profile).permit(:church, :state, :website, :birthday, :gender, :about, interests: [])
  end
end
