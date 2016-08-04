class UserMailer < ApplicationMailer

  def support_email(support,user)
    @user = user
    @support = support
    mail(to: "marcel.sands84@gmail.com", from: @support.user.email, subject: @support.subject)
  end

end
