require 'rails_helper'

RSpec.shared_examples '共通バリデーション' do |attribute, valid_value, invalid_value, blank_message, invalid_message|
  it "#{attribute}が空では登録できない" do
    @user[attribute] = ''
    @user.valid?
    expect(@user.errors.full_messages).to include(blank_message)
  end

  if invalid_message
    it "#{attribute}が不適切なフォーマットでは登録できない" do
      @user[attribute] = invalid_value
      @user.valid?
      expect(@user.errors.full_messages).to include(invalid_message)
    end
  end

  it "#{attribute}が適切なフォーマットなら登録できる" do
    @user[attribute] = valid_value
    @user.valid?
    expect(@user.errors.full_messages).to be_empty
  end
end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '各属性のバリデーション' do
      it_behaves_like '共通バリデーション', :nickname, 'nickname', nil,
                      "Nickname can't be blank", nil

      it_behaves_like '共通バリデーション', :email, 'test@example.com', 'invalid_email',
                      "Email can't be blank", "Email is invalid"

      it 'emailが重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it_behaves_like '共通バリデーション', :lastname, '山田', 'abc123',
                      "Lastname can't be blank", "Lastname is invalid"

      it_behaves_like '共通バリデーション', :firstname, '太郎', 'abc123',
                      "Firstname can't be blank", "Firstname is invalid"

      it_behaves_like '共通バリデーション', :lastname_yomi, 'ヤマダ', 'あいう',
                      "Lastname yomi can't be blank", "Lastname yomi is invalid"

      it_behaves_like '共通バリデーション', :firstname_yomi, 'タロウ', 'あいう',
                      "Firstname yomi can't be blank", "Firstname yomi is invalid"

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end