require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it "should create user" do
      user = User.create(
        firstname: "Princess",
        lastname: "Zelda",
        email: "zeldalink@example.com",
        password: "link",
        password_confirmation: "link"
      )
      expect(user).to (be_valid)
    end

    it "should have case sensitive matching passwords" do
      user = User.create(
        firstname: "Princess",
        lastname: "Zelda",
        email: "zelda@example.com",
        password: "LinK",
        password_confirmation: "link"
      )
      expect(user).to_not (be_valid)
    end

    it "should have unique emails" do
      user = User.create(
        firstname: "Princess",
        lastname: "Zelda",
        email: "zelda@example.com",
        password: "link",
        password_confirmation: "link"
      )
      user2 = User.create(
        firstname: "Princess",
        lastname: "Zelda",
        email: "zelda@EXAMPLE.COM",
        password: "zelda",
        password_confirmation: "zelda"
      )
      expect(user2).to_not (be_valid)
    end

    it "should have a password be min length of 3" do
      user = User.create(
        firstname: "Princess",
        lastname: "Zelda",
        email: "zelda@example.com",
        password: "hi",
        password_confirmation: "hi"
      )
      expect(user).to_not (be_valid)
    end
  end


  describe 'Authenticate_with_credentials' do
    it "should authenticate" do
      user = User.create(
        firstname: "Mario",
        lastname: "mario",
        email: "mario@example.com",
        password: "peach",
        password_confirmation: "peach"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not (be_nil)
    end

    it "shouldn't authenticate" do
      user = User.create(
        firstname: "Mario",
        lastname: "mario",
        email: "mArIo@example.com",
        password: "Peach",
        password_confirmation: "Peach"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to (be_nil)
    end

  end


end