class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def welcome_email(user, order_id, order, enhanced_order)
    @user = user
    

    @order = OrdersController::Order.find_by(id: order_id)
    @enhanced_order = @order.line_items
    # puts "NEW Orders #{@order}"
    if (@user != nil)
      email = @user.email
    end
    puts "Orders #{@order}"
    puts "@enhanced_order #{@enhanced_order}"

    @url  = 'http://example.com/login'
    mail(to: email, subject: "Thanks for your order. Order ID: #{order_id}")
  end
end
