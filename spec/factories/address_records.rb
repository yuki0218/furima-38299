FactoryBot.define do
  factory :address_record do
    post_code {'111-1111'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'大阪市'}
    address {'1-1'}
    building {'大阪ビル'}
    phone_number {'09012345678'}
  end
end
