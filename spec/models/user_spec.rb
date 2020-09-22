require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "create a new User" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save! 
    end

    it "validates :first_name, presence: true" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect( @user.first_name).to be_present
    end

    it "validates :last_name, presence: true" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.last_name).to be_present
    end

    it "validates :email, presence: true" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.email).to be_present
    end

    it "validates :password, presence: true" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.password).to be_present
    end

    it "validates :password_confirmation, presence: true" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.password_confirmation).to be_present
    end

    it "validates :password and :password_confirmation, to be the same" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.password_confirmation).to eq(@user.password)
    end

    #ask mentor hot to verif uniquess of a record in database
    xit "validates :email must be unique" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      #it { should validate_uniqueness_of(:name) }
      @user1 = User.new({first_name: "Paolo", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
     @user1.save!
     puts @user1.errors.full_messages
      expect(User.errors.full_messages).to include("Email has already been taken")
      #expect(@user1).to be == nil
    end

    it "validates :password length must be at least 3 characters" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.password.length).to be >= 3
    end

    it 'validate email has spaces before and after is still good' do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      user = User.authenticate_with_credentials("              mario@rossi.com", "123")     
      expect(@user).to be == user
    end
  
    it 'validate email has uppercase is still good' do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      user = User.authenticate_with_credentials("MARIO@rossi.com", "123")     
      expect(@user).to be == user
    end

  end
end
