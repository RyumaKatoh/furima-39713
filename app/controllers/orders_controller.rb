class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    elsif @item.user == current_user
      redirect_to root_path  
    end
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end 
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end  

end
