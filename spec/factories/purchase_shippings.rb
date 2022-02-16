FactoryBot.define do
  factory :purchase_shipping do
    postcode         { '123-4567' }
    prefecture_id    { 2 }
    address_city     { '東京都' }
    address_block    { '1-1' }
    address_building { '東京ハイツ' }
    phone_number     { '01234567890' }
  end
end
