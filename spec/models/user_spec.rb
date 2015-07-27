  require 'rails_helper'

RSpec.describe User, :type => :model do
  describe User do
    it "is valid with name, email and password" do
      expect(build(:user)).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with duplicate email address" do
      
      create(:user, email: 'john@example.com')
      user = build(:user, email: 'john@example.com')
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end  
  end  
end
