FactoryBot.define do
  factory :university_group do
    sequence(:title) { |n| "РБП-20#{n}" }
    association :faculty
    association :department
  end
end
