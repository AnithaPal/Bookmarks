  require 'rails_helper'

RSpec.describe User, :type => :model do
  describe User do
    it "is  valid with name, email and password" do
      user = User.new(
        name: 'User1',
        email: 'user1@example.com',
        password: 'helloworld')
      expect(user).to be_valid?
    end  
    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end  
    it "is invalid without an email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end  
    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end  

    it "is invalid with duplicate email address" do
      User.create(
        name: 'user2',
        email: 'user2@example.com',
        password: 'helloworld')

      user = User.new(
        name: 'user',
        email: 'user2@example.com',
        password: 'helloworld')
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end  
  end  
end
