class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.text { render plain: 'THank you for registering with us' }
      format.html { render html: "<h1>Welcome to My Awesome Site</h1>".html_safe }
    end
  end
end
