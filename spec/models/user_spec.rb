require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname that has more than 11 characters " do
      user = build(:user, nickname: "abcdcfghijk")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 10 characters)")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "abcdefghij")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_invalid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
    
    it "is invalid without family_name" do 
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    
    it "is invalid include Half-width" do 
      user = build(:user, family_name: "hankaku")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    it "is valid whith a family_name written in Full-width" do 
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without first_name" do 
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    
    it "is invalid include Half-width" do 
      user = build(:user, first_name: "hankaku")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it "is valid whith a first_name written in Full-width" do 
      user = build(:user)
      expect(user).to be_valid
    end


    it "is invalid without family_name_kana" do 
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "is invalid except Full-width katakana" do 
      user = build(:user, family_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    it "is valid whith a family_name_kana written in Full-width katakana" do 
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without first_name_kana" do 
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid except Full-width katakana" do 
      user = build(:user, first_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "is valid whith a first_name_kana written in Full-width katakana" do 
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without birthday" do 
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end