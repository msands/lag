class SupportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    @support.username = current_user.username
    @support.user = current_user
    if @support.save
      UserMailer.support_email(@support,@user).deliver_now
      redirect_to root_path, notice: "Your support ticket has been submitted!"
    else
      flash[:error] = "Something's not right; please resubmit"
      render "new"
    end
  end

  protected

  def support_params
    params.require(:support).permit(:username, :subject, :message)
  end
end
