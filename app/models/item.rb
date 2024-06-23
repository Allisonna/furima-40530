class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingcost

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 

end