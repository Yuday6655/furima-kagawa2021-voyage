class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_date

 validates :title, :detail, :price, presence: true
 validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

 validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
 validates :quality_id, numericality: { other_than: 1, message: "can't be blank" } 
 validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
 validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
 validates :shipment_date_id, numericality: { other_than: 1, message: "can't be blank" } 

 validates :price, numericality: true

end