FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials }
    text                  { Faker::Lorem.sentence }
    price                 { '300' }
    category_id           { '2' }
    condition_id          { '2' }
    delivery_burden_id    { '2' }
    area_id               { '2' }
    delivery_time_id      { '2' }

    # アソシエーション
    association :user

    # ダミー画像
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
