class Discipline < ApplicationRecord
  has_and_belongs_to_many :lecturers
  validates :title,
            uniqueness: { message: 'Дисциплина с таким названием уже существует в базе данных' },
            format: { with: /\A[А-я0-9\-—\s]+\z/, message: 'Используйте кириллические символы/цифры/пробел/тире/дефис' }
  before_create :normalize

  private
    def normalize
      self.title.strip!
      self.title.capitalize!
      self.title.gsub!(/\s{2,}/, ' ')
    end
end
