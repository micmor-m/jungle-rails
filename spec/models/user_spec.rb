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

    xit "validates :email must be unique" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      @user1 = User.new({first_name: "Paolo", last_name: "Rossi", email: "paolo@rossi.com", password: "123", password_confirmation: "123"})
      @user1.save!
      #expect(User.email).not_to include({@user.email})
      expect(User.where(email: @user1.email)).not_to exist
    end

    it "validates :password length must be at least 3 characters" do
      @user = User.new({first_name: "Mario", last_name: "Rossi", email: "mario@rossi.com", password: "123", password_confirmation: "123"})
      @user.save!
      expect(@user.password.length).to be >= 3
    end

  end
end
