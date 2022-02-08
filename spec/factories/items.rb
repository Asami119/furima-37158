FactoryBot.define do
  factory :item do
    name { 'テスト' }
    description { 'テスト' }
    category_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    days_post_id { 2 }
    price { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
