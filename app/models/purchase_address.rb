class PurchaseAddress
  include ActiveModel::Model
    attr_accessor :post_code, :shipping_area_id, :municipalities, :house_number, :building_name, :telephone_number, :purchase_id, :user_id, :item_id

    validates :municipalities,   presence: true
    validates :house_number,     presence: true
    validates :telephone_number, presence: true
    validates :user_id,          presence: true
    validates :item_id,          presence: true
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
    end
end