class ChargesController < ApplicationController
  before_action :set_item

  def new
  end
  
  def create
    # Amount in cents
    @amount = @game.price * 100
    @amount = @amount.to_i
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
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
