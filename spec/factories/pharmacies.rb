FactoryBot.define do
  factory :pharmacy do
    name { Faker::Company.name + " Pharmacy" }
    city { Faker::Address.city }
    email { Faker::Internet.email }
  end
end
