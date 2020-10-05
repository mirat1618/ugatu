FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "john#{i}@doe.com" }
    password { 'hello123' }
    password_confirmation { 'hello123' }
  end
end
