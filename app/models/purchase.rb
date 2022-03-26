class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  belongs_to :user
  belongs_to :item
  has_one :address
end
