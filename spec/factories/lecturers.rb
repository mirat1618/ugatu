FactoryBot.define do
  factory :lecturer do
    sequence(:fullname, ('А'..'я').cycle) { |n| "Давлетов Финат Ильшатович#{n}" }
  end
end
