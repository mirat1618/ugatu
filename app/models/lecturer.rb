class Lecturer < ApplicationRecord
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :university_groups
  has_and_belongs_to_many :disciplines
  validates :fullname,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' }
end