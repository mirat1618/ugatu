FactoryBot.define do
  factory :department do
    sequence(:title, ('А'..'я').cycle) { |n| "Вычислительной математики и кибернетики#{n}" }
    sequence(:abbreviation, ('А'..'я').cycle) { |n| "ВМиК#{n}" }
    association :faculty

    after(:build) do |department|
      department.faculty = create(:faculty)
    end
  end
end
