require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.1
    @order_form = FactoryBot.build(:order_form,user_id: user.id,item_id: item.id)
  end

  describe '商品購入機能' do
    context '正常系' do
      it 'すべての項目が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end

      it '建物名がなくても保存できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '異常系' do
      it 'user_idが空では保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では保存できない' do
        @order_form.post = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post can't be blank")
      end

      it '郵便番号にハイフンが含まれていない場合保存できない' do
        @order_form.post = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
      end

      it '都道府県が空では保存できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では保存できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @order_form.telephone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone can't be blank")
      end

      it '電話番号にハイフンが含まれている場合保存できない' do
        @order_form.telephone = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid. Include only digits.")
      end

      it '電話番号が9桁以下では保存できない' do
        @order_form.telephone = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid. Include only digits.")
      end

      it '電話番号が12桁以上では保存できない' do
        @order_form.telephone = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid. Include only digits.")
      end

      it '電話番号が全角数字では保存できない' do
        @order_form.telephone = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid. Include only digits.")
      end
    end
  end
end
