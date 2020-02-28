FactoryBot.define do

  factory :diary do
    title            {Faker::String.random(length: 1..15)}
    impression       {Faker::String.random(length: 1..150)}
    user
  end
end