class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :shipping_duration


#空の投稿を保存できないようにする
validates :image, presence: true
validates :name, presence: true
validates :item_detail, presence: true
validates :price, presence: true

#ジャンルの選択が「---」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1, message: "can't be black" }
validates :item_condition_id, numericality: { other_than: 1, message: "can't be black" }
validates :delivery_burden_id, numericality: { other_than: 1, message: "can't be black" }
validates :prefecture_id, numericality: { other_than: 1, message: "can't be black" }
validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be black" }

validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"can't be less than 300, greater than 9999999" }
  # 半角数値のみを許可
validates :price, numericality: { only_integer: true, message: "should be a half-width number" }

end