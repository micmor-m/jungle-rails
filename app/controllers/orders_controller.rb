class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @enhanced_order = @order.line_items
  end

 
  def create
    #get email of the current user for the order
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if  @current_user
      @currrent_email = @current_user[:email]
    else
      @currrent_email = "User not login"
    end
     
    charge = perform_stripe_charge
    order  = create_order(charge, @currrent_email)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge, email)
    order = Order.new(
      email: email, #params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
