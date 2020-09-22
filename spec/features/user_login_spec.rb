require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: "Nancy",
      last_name: "Hoffman",
      email: "nancy@nancy.com",
      password: "123",
      password_confirmation: "123"
    )
  end
  
  scenario "User sign-in" do
    visit root_path
    #save_screenshot "Product with picture.png"
    first(:link, "Login").click
    #sleep(1)
    #save_screenshot "Login.png"
    #within '.'
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    save_screenshot "Login.png"
    sleep(1)
    first(:button, 'Submit').click
    save_screenshot "mainpage.png"
    expect(page).to have_text("Signed in as #{@user.first_name}")
  end
end
