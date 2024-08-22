require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '正常系のテスト' do
    it '全ての値が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '異常系のテスト' do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが数字のみの場合は登録できない' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが英字のみの場合は登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードに全角文字が含まれている場合は登録できない' do
      @user.password = 'abc123あ'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'lastnameに半角文字が含まれていると登録できない' do
      @user.lastname = 'Yamada123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'firstnameに半角文字が含まれていると登録できない' do
      @user.firstname = 'Yamada123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Fastname is invalid")
    end

    it 'lastname_yomiが空では登録できない' do
      @user.lastname_yomi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname yomi can't be blank")
    end

    it 'lastname_yomiに平仮名が含まれていると登録できない' do
      @user.lastname_yomi = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname_yomi is invalid")
    end

    it 'lastname_yomiに漢字が含まれていると登録できない' do
      @user.lastname_yomi = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname_yomi is invalid")
    end

    it 'firstname_yomiが空では登録できない' do
      @user.firstname_yomi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname yomi can't be blank")
    end

    it 'firstname_yomiに平仮名が含まれていると登録できない' do
      @user.firstname_yomi = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname_yomi is invalid")
    end

    it 'firstname_yomiに漢字が含まれていると登録できない' do
      @user.firstname_yomi = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname_yomi is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'lastnameが正しい形式でなければ登録できない' do
      @user.lastname = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

  end
end
