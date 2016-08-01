class SupportsController < ApplicationController
  def new
  end

  protected

  def support_params
    params.require(:support).permit(:username, :subject, :message)
  end
end
