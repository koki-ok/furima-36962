class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  belongs_to :user
 # has_one :purchase
  has_one_attached :image

  validates :product_name, :product_description, :price, presence: true
  validates :category_id, :product_condition_id, :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}

end
