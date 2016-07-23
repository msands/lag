module UserProfilesHelper

  def current_user_avatar
    @current_user.user_profile.avatar.filename
  end

  def user_avatar
    @user_profile.avatar.filename
  end
end
