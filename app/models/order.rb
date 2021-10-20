class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  def save
    # 購入情報、変数orderに代入
    donation = Donation.create(price: price, user_id: user_id)
    # 送付先情報を保存する
    # order_idには、変数orderのidと指定
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, address_number: address_number, building: building, :phone_number, phone_number, order_id: order.id)
  end

end
