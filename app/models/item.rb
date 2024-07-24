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

  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は¥300〜¥9,999,999の間でなければなりません' }

  validates :image, presence: true
end
