FactoryBot.define do
  factory :questionnaire do
    first_question { 0 }
    second_question { 1 }
    third_question { 2 }
    fourth_question { 3 }
    fifth_question { 4 }
    sixth_question { 5 }
    seventh_question { 4 }
    association :lecturer
    association :university_group
    association :discipline
  end
end
