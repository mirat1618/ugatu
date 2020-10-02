FactoryBot.define do
  factory :user do
    email { 'john@doe.com' }
    password { 'hello123' }
    password_confirmation { 'hello123' }
  end
end
