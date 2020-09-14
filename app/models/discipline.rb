class Discipline < ApplicationRecord
  has_and_belongs_to_many :lecturers
  validates :title,
            uniqueness: true,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' }
  before_create :normalize

  private
    def normalize
      self.title.capitalize!
      self.title.strip!
      self.title.gsub!(/\s{2,}/, ' ')
    end
end
