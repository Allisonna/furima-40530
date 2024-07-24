class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_area_id, :city, :address1, :address2, :tel, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :user_id
    validates :item_id
    validates :city
    validates :address1
    validates :tel, format: { with: /\A\d+\z/, message: 'はハイフン無しの数字のみ入力してください' }
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(postcode:, shipping_area_id:, city:, address1:, address2:,
                   tel:, purchase_id: purchase.id)
  end
end
