class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create,:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold, only: [:edit, :update]


  def index
    @items = Item.order(created_at: :desc)
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

  def show  end

  def edit
    

  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy

    @item.destroy
    redirect_to root_path
  end
 

  private

  def set_item
    @item = Item.find(params[:id])
  end

  ## correct_userで出品者チェックする
  def correct_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def redirect_if_sold
    if @item.sold?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end




