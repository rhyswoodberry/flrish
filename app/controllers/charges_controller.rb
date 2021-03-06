class ChargesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def new
  end
  
  def create
    # Amount in cents
    @amount = @game.price * 100
    @amount = @amount.to_i
    
    @user = current_user
    UserNotifierMailer.send_new_purchase_email(@user).deliver
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'flrish customer',
      :currency    => 'usd'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
  private
  def set_item
    @game = Game.find(params[:game_id])
  end

end
