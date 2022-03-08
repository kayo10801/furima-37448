FactoryBot.define do
  factory :furima do
    name            {Faker::Name.initials(number: 2)}
    introduction    {'introduction'}
    condition_id    {'2'}
    category_id     {'2'}
    price           {'300'}
    postage_id      {'2'}
    prefecture_id   {'2'}
    days_to_ship_id {'2'}
    association :user 

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
