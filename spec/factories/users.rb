FactoryBot.define do
  factory :user do
    name        { Faker::Name.initials(number: 4) }
    email       { Faker::Internet.freeze.email }
    password    { '1q1q1q1' }
    password_confirmation { password }
    f_name      { '漢字' }
    l_name      { '平仮名' }
    f_name_kana { 'カナ' }
    l_name_kana { 'カナ' }
    birthday    { '19900629' }
  end
end
