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

  validates :image,                        presence: true
  validates :product_name,                 presence: true
  validates :product_description,          presence: true
  validates :category_id,                  presence: true
  validates :product_condition_id,         presence: true
  validates :burden_of_shipping_charge_id, presence: true
  validates :shipping_area_id,             presence: true
  validates :days_to_ship_id,              presence: true
  validates :category_id, :product_condition_id, :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
end
