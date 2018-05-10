class UserNotifierMailer < ApplicationMailer
  default :from => 'support@flrish.com'

  # Send an email to users when they upload a game
  def send_new_game_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Success! You uploaded a game!' )
  end

  # Send an email to users upon successful purchase
  def send_new_purchase_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for your purchase!')
  end
  
end
