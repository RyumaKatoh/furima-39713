class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase

  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_burden
  belongs_to :prefecture
  # belongs_to :shipping_duration
end
