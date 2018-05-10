class UserMailer < ApplicationMailer
  default from: 'from@example.com'
  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    # my code here yay
    mail(to: user.username, subject: 'Welcome to Ninetynyan Cats!')
  end
end
