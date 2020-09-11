class Department < ApplicationRecord
  belongs_to :faculty
  has_many :university_groups, dependent: :destroy
  has_and_belongs_to_many :lecturers
  validates :title,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' },
            uniqueness: true,
            length: { maximum: 200 }
  validates :abbreviation,
            format: { with: /\A[А-я]+\z/, message: 'Используйте только кириллические символы' },
            uniqueness: true,
            length: { maximum: 7}
  before_create :normalize

  private
  def normalize
    self.title.capitalize!
    self.title.strip!
    self.title.gsub!(/\s{2,}/, '')
    self.abbreviation.strip!
    self.abbreviation.gsub!(/\s/, '')
  end
end