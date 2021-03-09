FactoryBot.define do
  factory :buyer_history_info do
    post_num          { '123-4567' }
    area_id           { 2 }
    municipalities    { 'う市' }
    address           { 'アドレス' }
    builing_name      { '建物データ' }
    phone_num         { '12345678910' }
    token             { 'token' }
  end
end
