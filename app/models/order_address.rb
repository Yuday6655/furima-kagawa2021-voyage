class OrderAddress
  include ActiveModel::Model
  attr_accessor :order_id, :postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, address_number: address_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end
