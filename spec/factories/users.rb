FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'aaaa1111'}
    password_confirmation {password}
    family_name {'佐藤'}
    first_name {'太郎'}
    family_name_kana {'サトウ'}
    first_name_kana {'タロウ'}
    birth_day {'2000-01-01'}
  end
end