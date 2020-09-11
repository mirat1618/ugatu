class UniversityGroup < ApplicationRecord
  belongs_to :department
  belongs_to :faculty
  has_and_belongs_to_many :lecturers
  validates :title,
            format: { with: /\A[А-я0-9\-]+\z/, message: 'Используйте кириллические символы/цифры/дефис' },
            uniqueness: true,
            length: { maximum: 12 }
end
