FactoryBot.define do
  factory :collected_coin do
    value { rand(0..100) }
    user
  end
end
