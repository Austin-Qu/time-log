require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "creation" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "require phone attr to only have integers" do
      @user.phone = "qwertasdfg"
      expect(@user).to_not be_valid
    end

    it "require phone attr to only have 10 chars" do
      @user.phone = "qwertasdfggg"
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has a full name method that combines first and last names" do
      expect(@user.full_name).to eq("SDF, QWE")
    end
  end
end
