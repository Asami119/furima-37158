FactoryBot.define do
  factory :user do
    nickname              { 'テスト用ユーザー' }
    email                 { Faker::Internet.free_email }
    password              { 'test11' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '1970-01-01' }
  end
end
