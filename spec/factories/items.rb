FactoryBot.define do
  factory :item do
    item_name               { Faker::Name.initials(number: 2) }
    description             { Faker::Lorem.sentence }
    category_id             { 2 }
    status_id               { 2 }
    delivery_fee_id         { 2 }
    shipping_address_id     { 2 }
    until_shipping_id       { 2 }
    price                   { 3000 }
    association :user
  end
end
