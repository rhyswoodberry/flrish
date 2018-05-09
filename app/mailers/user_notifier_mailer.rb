class UserNotifierMailer < ApplicationMailer
  default :from => 'support@flrish.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_new_game_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Success! You uploaded a game!' )
  end
end
