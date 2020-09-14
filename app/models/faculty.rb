class Faculty < ApplicationRecord
  has_many :departments, dependent: :destroy
  has_many :university_groups, dependent: :destroy
  validates :title,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' },
            uniqueness: {message: 'Факультет с таким названием уже существует в базе данных' },
            length: { maximum: 200, too_long: "Длина введенного названия больше максимальной — %{count}" }
  validates :abbreviation,
            format: { with: /\A[А-я]+\z/, message: 'Используйте только кириллические символы' },
            uniqueness: {message: 'Факультет с такой аббревиатурой уже существует в базе данных' },
            length: { maximum: 15, too_long: "Длина введенной аббревиатуры больше максимальной — %{count}" }
  before_create :normalize

  private
    def normalize
      self.title.strip!
      self.title.capitalize!
      self.title.gsub!(/\s{2,}/, ' ')
    end
end
