FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'abcd1234'}
    password_confirmation {'password'}
    last_name             {'全角'}
    first_name            {'全角'}
    last_name_kana        {'カナ'}
    first_name_kana       {'カナ'}
    birth_date             {Faker::Date.birthday(min_age: 18, max_age: 65)}
    
  end
end