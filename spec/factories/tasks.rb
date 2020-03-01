FactoryBot.define do

  factory :task do
    # day             {Faker::Date.in_date_period}
    day             {"#{Date.current}"}
    beforetime_id   {Faker::Number.between(from: 1, to: 24)}
    aftertime_id    {Faker::Number.between(from: beforetime_id, to: 25)}
    # doing           {Faker::String.random(length: 1..20)}
    doing           {"テストやること"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end