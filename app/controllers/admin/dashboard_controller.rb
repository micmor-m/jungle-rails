class Admin::DashboardController < ApplicationController
  def show
    @products_qty = Product.all.count
    #raise @products.inspect
    @categories_qty = Category.all.count
    #raise @categories.inspect

  end
end
