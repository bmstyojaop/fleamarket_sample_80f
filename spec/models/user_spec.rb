require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームは必須です")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("emailは必須です")
    end
    
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("パスワードは必須です")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("パスワードが一致しません")
    end

    it "is invalid with a nickname that has more than 11 characters " do
      user = build(:user, nickname: "abcdcfghijk")
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームは１０文字までです")
    end

    it "is valid with a nickname that has less than 10 characters " do
      user = build(:user, nickname: "abcdefghij")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("そのemailは既に登録されています")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは6文字以上です")
    end
    
    it "is invalid without family_name" do 
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("名字は必須です")
    end
    
    it "is invalid include Half-width" do 
      user = build(:user, family_name: "hankaku")
      user.valid?
      expect(user.errors[:family_name]).to include("全角で入力してください")
    end

    it "is valid whith a family_name written in Full-width" do 
      user = build(:user, family_name: user.family_name)
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without first_name" do 
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("名前は必須です")
    end
    
    it "is invalid include Half-width" do 
      user = build(:user, first_name: "hankaku")
      user.valid?
      expect(user.errors[:first_name]).to include("全角で入力してください")
    end

    it "is valid whith a first_name written in Full-width" do 
      user = build(:user, first_name: user.first_name)
      user.valid?
      expect(user).to be_valid
    end


    it "is invalid without family_name_kana" do 
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("ミョウジは必須です")
    end

    it "is invalid except Full-width katakana" do 
      user = build(:user, family_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("カタカナで入力してください")
    end

    it "is valid whith a family_name_kana written in Full-width katakana" do 
      user = build(:user, family_name_kana: user.family_name_kana)
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without first_name_kana" do 
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("ミョウジは必須です")
    end

    it "is invalid except Full-width katakana" do 
      user = build(:user, first_name_kana: "ひらがな")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("カタカナで入力してください")
    end

    it "is valid whith a first_name_kana written in Full-width katakana" do 
      user = build(:user, first_name_kana: user.first_name_kana)
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without birthday" do 
      user = build(:user, :birthday)
      user.valid?
      expect(user.errors[:birthday]).to include("")
    end
  end
end