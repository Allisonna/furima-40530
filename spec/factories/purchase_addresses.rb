FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    shipping_area_id { 1 }
    city { '東京都' }
    address1 { '1-1' }
    address2 { '東京ハイツ' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
