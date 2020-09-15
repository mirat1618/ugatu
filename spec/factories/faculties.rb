FactoryBot.define do
  factory :faculty do
    sequence(:title, ('А'..'я').cycle) { |n| "Информатики и робототехники#{n}" }
    sequence(:abbreviation, ('А'..'я').cycle) { |n| "ФИРТ#{n}" }
  end
end
