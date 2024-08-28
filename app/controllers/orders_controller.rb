class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :post, :prefecture_id, :municipality, :street_address,
      :building_name, :telephone, :token
    ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
