class ProfilePicturesController < ActionController::Base

  def create
    ProfilePicture.create(
      avatar_id: params[:avatar_id],
      user_id: current_user.id)
    flash[:notice] = 'Avatar updated.'
    redirect_to :back
  end

end
