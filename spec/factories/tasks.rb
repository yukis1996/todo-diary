FactoryBot.define do

  factory :task do
    day             {Faker::Date.in_date_period}
    beforetime_id   {Faker::Number.between(from: 1, to: 24)}
    aftertime_id    {Faker::Number.between(from: beforetime_id, to: 25)}
    doing           {Faker::String.random(length: 1..20)}
    user
  end
end