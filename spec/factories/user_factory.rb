FactoryBot.define do
  factory :user do
    email 'user@email.com'
    password '123456'
    password_confirmation  'password'
  end
end
