class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number, :item_id,
                :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_town
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, address_number: address_number,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
