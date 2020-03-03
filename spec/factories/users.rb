FactoryBot.define do

  factory :user do
    # nickname = Faker::Name.last_name(max_length: 10)
    nickname {"test"}
    email                 {Faker::Internet.email}
    # password = Faker::Internet.password(min_length: 8)
    # password {password}
    # password_confirmation {password}  
    prefecture_id           {Faker::Number.between(from: 1, to: 47)}
  end

end