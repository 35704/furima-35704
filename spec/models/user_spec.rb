require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全部の項目が存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録ができないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がなければ登録できないこと" do
      @user.email = 'kkkkkk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailがあれば登録ができないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "passwordが空では登録ができないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが６文字以上なら登録できること" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end
    it "passwordが５文字以下なら登録ができないこと" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "password_confirmationが空では登録できないこと" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致しないと登録できないこと" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameは全角の漢字、カタカナ、ひらがなでなければ登録できないこと" do
      @user.first_name = 'yyyy'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameが空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが全角の漢字、カタカナ、ひらがなでなければ登録できないこと" do
      @user.last_name ='yyyy'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが全角のカタカナでなければ登録できないこと" do
      @user.first_name_kana = 'yyyy'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaが全角のカタカナでなければ登録できないこと" do
      @user.last_name_kana = 'yyyy'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "birthdayが空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end  
end
