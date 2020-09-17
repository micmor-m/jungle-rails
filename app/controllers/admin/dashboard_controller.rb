class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products_qty = Product.all.count
    #raise @products.inspect
    @categories_qty = Category.all.count
    #raise @categories.inspect

  end
end
