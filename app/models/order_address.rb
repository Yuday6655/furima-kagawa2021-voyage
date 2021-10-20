class OrderAddress
  include ActiveModel::Model
  attr_accessor :order_id, :postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    Order.create(:item_id, :user_id)
    Address.create(:order_id, :postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number)
  end

end
