class UniversityGroup < ApplicationRecord
  belongs_to :department
  belongs_to :faculty
  has_and_belongs_to_many :lecturers
  validates :title,
            format: { with: /\A[А-я0-9\-]+\z/, message: 'Используйте кириллические символы/цифры/дефис' },
            uniqueness: { message: 'Группа с таким названием уже существует в базе данных'},
            length: { maximum: 12, too_long: "Длина введенного названия больше максимальной — %{count}" }
  validates :faculty_id, presence: { message: 'Не указан факультет' }
  validates :department_id, presence: { message: 'Не указана кафедра' }
end
