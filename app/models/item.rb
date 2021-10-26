class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_date

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :quality_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipment_date_id
  end

  validates :price, numericality: true
end
