class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 

end