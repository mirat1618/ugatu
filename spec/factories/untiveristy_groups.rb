FactoryBot.define do
  factory :university_group do
    sequence(:title) { |n| "РБП-20#{n}" }
    association :faculty
    association :department

    after(:build) do |university_group|
      university_group.faculty = create(:faculty)
      university_group.department = create(:department)
    end
  end
end
