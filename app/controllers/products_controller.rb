class ProductsController < ApplicationController

  def index
    #this used the model to fetch or create some data
    @products = Product.all.order(created_at: :desc)
    #and implicity render the page index
  end

  def show
    @product = Product.find params[:id]
    #and implicity render the page show/:id
    #INSTANCe variable like @products are not explicity pass to the render function
    #RUBY do it 'magically' and pass it direclty to the VIEW
  end

end
