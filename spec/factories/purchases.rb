FactoryBot.define do
  factory :user_purchase do
    token                    { 123 }
    postal_code              { "123-4567" }
    prefecture_id            { 2 }
    city                     {"横浜市緑区"}
    block                    {"青山1-1-1"}
    phone_number             { "08012345678" }
    # association :user
    # association :item

  end
end