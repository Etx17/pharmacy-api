FactoryBot.define do
  factory :sale_product do
    pharmacy
    product
    stock_count { 10 }
    selling_price { Faker::Number.number(digits: 3) }
  end
end
