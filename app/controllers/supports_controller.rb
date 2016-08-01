class SupportsController < ApplicationController
  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    if @support.save
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
