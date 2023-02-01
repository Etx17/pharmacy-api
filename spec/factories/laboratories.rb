FactoryBot.define do
  factory :laboratory do
    name { Faker::Company.name }
    email { Faker::Internet.email }
  end
end
