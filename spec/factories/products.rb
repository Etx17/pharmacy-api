FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    laboratory
    lab_selling_price { Faker::Number.number(digits: 3) }
    cost_of_production { Faker::Number.number(digits: 3) }
  end
end
