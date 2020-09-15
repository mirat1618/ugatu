class Questionnaire < ApplicationRecord
  belongs_to :lecturer
  belongs_to :university_group
  belongs_to :discipline
  validates :first_question, :second_question, :third_question,
            :fourth_question, :fifth_question, :sixth_question,
            numericality: { only_integer: true, message: 'Значение должно быть целым' },
            inclusion: { in: 0..5, message: 'Неверное значение' }
  validates :seventh_question, inclusion: { in: 0..4, message: 'Неверное значение' },
            numericality: { only_integer: true, message: 'Значение должно быть целым' }
end
