class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  belongs_to :user
  belongs_to :item
  has_one :address

  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" } 
end
