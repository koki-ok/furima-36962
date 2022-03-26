class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :municipalities, :house_number, :building_name, :telephone_number, :image,
                :user_id, :item_id

  validates :post_code, presence: true,
                        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Half-width number. Include hyphen(-).' }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities,   presence: true
  validates :house_number,     presence: true
  validates :telephone_number, presence: true,
                               format: { with: /\A^0[0-9]{9,10}$\z/, message: 'is invalid. 10 to 11 characters. Half-width numbers only.' }
  validates :user_id,          presence: true
  validates :item_id,          presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
