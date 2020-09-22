require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "User click add button for the first product" do
    visit root_path
    save_screenshot "Product with picture.png"
    expect(page).to have_css 'article.product', count: 10

    first(:button, 'Add').click
    sleep(1)
    save_screenshot "Cart has 1.png"
    expect(page).to have_text("My Cart (1)")
  end
end
