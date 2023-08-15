class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
    # @item = Item.find(params[:id])
  end  

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end  

  def show 
  end  

  def edit
    if !user_signed_in?
      redirect_to new_user_session_path 
    elsif current_user != @item.user
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity  
    end 
  end  

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end  

  private
  def item_params
    params.require(:item).permit(:image, :name, :item_detail, :category_id, :item_condition_id, :delivery_burden_id, :prefecture_id, :shipping_duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  
end
