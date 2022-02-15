class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :address_city, :address_block, :address_building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :address_city
    validates :address_block
    validates :phone_number
  end

  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  # validates :address_city
  # validates :address_block
  # validates :address_building
  # validates :phone_number

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, address_city: address_city, address_block: address_block, address_building: address_building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
