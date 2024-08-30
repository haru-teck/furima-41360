class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :ensure_correct_user, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item  # 支払い処理を呼び出す
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def order_params
    params.require(:order_form).permit(
      :post, :prefecture_id, :municipality, :street_address,
      :building_name, :telephone
    ).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ensure_correct_user
      if @item.user_id == current_user.id || @item.sold?
        redirect_to root_path
      end
    end
  end