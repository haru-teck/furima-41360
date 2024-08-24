class ItemsController < ApplicationController
  def index
    # 必要に応じてここにデータベースからアイテムを取得するためのコードを追加します
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :ship_day_id, :price, :description).merge(user_id: current_user.id)
  end
end




