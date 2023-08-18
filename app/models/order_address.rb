class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :token

  with_options presence: true do
    # addressモデル
    validates :post_code,     format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be black" }
    validates :city          
    validates :address       
    validates :phone_number,  format: { with: /\A\d+\z/, message: "is invalid. Input only number" }, length: { minimum: 10, maximum: 11 }
 
    # Token
    validates :token

    # User,Itemとの紐づき
    validates :user_id
    validates :item_id
  end  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id )
  end
end  