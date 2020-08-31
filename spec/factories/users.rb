FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    family_name           { '鈴木' }
    first_name            { '健太' }
    family_name_kana      { 'スズキ' }
    first_name_kana       { 'ケンタ' }
    birthday              { Faker::Date.between(from: 100.years.ago, to: Date.today) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
  end
end
