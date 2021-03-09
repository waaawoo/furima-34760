FactoryBot.define do
  factory :buyer_history_info do
    post_num          { '123-4567' }
    area_id           { 2 }
    municipalities    { 'う市' }
    address           { 'アドレス' }
    phone_num         { '12345678910' }
    token             { 'token' }
    user_id           { 1 }
    item_id           { 1 }
  end
end
