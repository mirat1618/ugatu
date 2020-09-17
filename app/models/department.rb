class Department < ApplicationRecord
  belongs_to :faculty
  has_many :university_groups, dependent: :destroy
  has_and_belongs_to_many :lecturers
  validates :title,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' },
            uniqueness:  {message: 'Кафедра с таким названием уже существует в базе данных' },
            length: { maximum: 200, too_long: "Длина введенного названия больше максимальной — %{count}" }
  validates :abbreviation,
            format: { with: /\A[А-я]+\z/, message: 'Используйте только кириллические символы' },
            uniqueness: {message: 'Кафедра с такой аббревиатурой уже существует в базе данных' },
            length: { maximum: 15, too_long: "Длина введенной аббревиатуры больше максимальной — %{count}"}
  validates :faculty_id, presence: { message: 'Не указан факультет' }
  before_create :normalize

  private
    def normalize
      self.title.strip!
      self.title.capitalize!
      self.title.gsub!(/\s{2,}/, ' ')
    end
end
