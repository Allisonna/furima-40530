FactoryBot.define do
  factory :item do
    association :user
    title { '商品名' }
    content { '商品の説明' }
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    after(:build) do |message|
      message.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
