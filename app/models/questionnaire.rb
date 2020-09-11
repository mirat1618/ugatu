class Questionnaire < ApplicationRecord
  belongs_to :lecturer
  belongs_to :university_group
  belongs_to :discipline
  validates :first_question, :second_question, :third_question,
            :fourth_question, :fifth_question, :sixth_question,
            inclusion: 0..5
  validates :seventh_question, inclusion: 0..4
end
