class Questionnaire < ApplicationRecord
  belongs_to :lecturer
  belongs_to :university_group
  belongs_to :discipline
  validates :first_question, :second_question, :third_question,
            :fourth_question, :fifth_question, :sixth_question,
            numericality: { only_integer: true, message: 'Значение должно быть целым' },
            inclusion: { in: 0..5, message: 'Неверное значение' }
  validates :seventh_question, inclusion: { in: 0..100, message: 'Неверное значение' },
            numericality: { only_integer: true, message: 'Значение должно быть целым' }
  validates :lecturer_id, presence: { message: 'Не указан преподаватель' }
  validates :discipline_id, presence: { message: 'Не указана дисциплина' }
  validates :university_group_id,presence: { message: 'Не указана учебная группа'}
end
