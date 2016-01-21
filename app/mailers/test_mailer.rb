class TestMailer < ApplicationMailer
	default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


  def test(email)
    mail(to: email, subject: 'testing..1-2-3')
  end

end
