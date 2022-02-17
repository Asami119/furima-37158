class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :address_city, :address_block, :address_building, :phone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :address_city
    validates :address_block
    validates :phone_number
    validates :token
  end

  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は、10桁以上11桁以内の半角数値のみ入力可能です' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, address_city: address_city, address_block: address_block,
                    address_building: address_building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
