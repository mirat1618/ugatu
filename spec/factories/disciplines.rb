FactoryBot.define do
  factory :discipline do
    sequence(:title) { |n| "Газогидродинамика#{n.to_s}" }
  end
end
