require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
   context '商品出品ができる場合' do
    it 'すべての項目が存在すれば保存できる' do
      expect(@item).to be_valid
    end
   end
  end

  context '異常系のテスト' do

    it "titleが空では登録できない" do
      @item.title = ''
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it "画像が添付されていないと登録できない" do
      @item.image = nil
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "explanationが空では登録できない" do
      @item.explanation = ''
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_idが選択されていない場合は登録できない" do
      @item.category_id = 1
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "status_idが選択されていない場合は登録できない" do
      @item.status_id = 1
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "shipping_fee_idが選択されていない場合は登録できない" do
      @item.shipping_fee_id = 1
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it "prefecture_idが選択されていない場合は登録できない" do
      @item.prefecture_id = 1
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "ship_day_idが選択されていない場合は登録できない" do
      @item.ship_day_id = 1
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end

    it "priceが空では登録できない" do
      @item.price = ''
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが299以下では登録できない" do
      @item.price = 299
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが10000000以上では登録できない" do
      @item.price = 10000000
      @item.valid?
 
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが半角数値以外では登録できない" do
      @item.price = 'three hundred'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    
      @item.price = '３００'  # 全角数字
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    
      @item.price = '300円'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    
  end
end
