require "rails_helper"

describe User do
  describe 'user#name' do
    example 'name shold be hoge'do
      user = User.new(name: "hoge", full_name: "hogehoge", hashed_password: nil)
      expect(user.name).to eq("hoge")
    end
  end

  describe 'user#full_name' do
    example 'full_name shold be hoge'do
      user = User.new(full_name: "hogehoge")
      expect(user.full_name).to eq("hogehoge")
    end
  end

  describe "user#hashed_password" do
    example 'hashed_password should not be password'do
      user = User.new(name: "hoge", full_name: "hoge", hashed_password: nil)
      expect(user.hashed_password).not_to eq("password")
    end
  end

  describe "user#authenticate" do 
    example "return true if password is correct" do 
      m = FactoryGirl.create(:user)
      expect(User.authenticate(m.full_name, m.password).name).to eq("Taro1")
    end 
  end 


end
