class MyProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    @user_profile = current_user.user_profile
    render "show"
  end

end
