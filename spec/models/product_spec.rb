require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "create a new Category and Product" do
      @category = Category.new({ name: "Sport"})
      @category.save!
      @categoryID = @category[:id]
      @product = Product.new({name: "Ball", description: "Official world cup soccer ball", price_cents: 542300, quantity: 1, category_id:@categoryID})
      @product.save!
      
    end

    it "validates :name, presence: true" do
      @category = Category.new({ name: "Sport"})
      @category.save!
      @categoryID = @category[:id]
      @product = Product.new({name: nil, description: "Official world cup soccer ball", price_cents: 542300, quantity: 1, category_id:@categoryID})
      @product.save!
      expect(@product.name).to be_present
    end

    it "validates :price, presence: true" do
      @category = Category.new({ name: "Sport"})
      @category.save!
      @categoryID = @category[:id]
      @product = Product.new({name: "Ball", description: "Official world cup soccer ball", price_cents: 542300, quantity: 1, category_id:@categoryID})
      @product.save!
      expect(@product.price).to be_present
    end

    it "validates :quantity, presence: true" do
      @category = Category.new({ name: "Sport"})
      @category.save!
      @categoryID = @category[:id]
      @product = Product.new({name: "Ball", description: "Official world cup soccer ball", price_cents: 542300, quantity: 2, category_id:@categoryID})
      @product.save!
      expect(@product.quantity).to be_present
    end

    it "validates :category_id, presence: true" do
      @category = Category.new({ name: "Sport"})
      @category.save!
      @categoryID = @category[:id]
      @product = Product.new({name: "Ball", description: "Official world cup soccer ball", price_cents: 542300, quantity: 2, category_id:@categoryID})
      @product.save!
      expect(@product.category_id).to be_present
    end
  end
end
