class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @Items = item.order("created_at DESC")
  end  

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    # elsif @item.image.attached?  
    #   redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end  

  private
  def item_params
    params.require(:item).permit(:image, :name, :item_detail, :category_id, :item_condition_id, :delivery_burden_id, :prefecture_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end
end
