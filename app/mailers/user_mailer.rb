class UserMailer < ApplicationMailer
  def new_user_notification(user)
    @user = user
    # mail(to: User.pluck(:email), subject: 'New User Signed In')
    mail(to: 'khachouw@gmail.com', subject: 'New User Signed In')
  end
end
