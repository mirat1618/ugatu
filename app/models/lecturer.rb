class Lecturer < ApplicationRecord
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :university_groups
  has_and_belongs_to_many :disciplines
  has_many :questionnaires
  validates :fullname,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' }
  before_create :normalize

  def count_average
    puts self.questionnaires
  end

  private
  def normalize
    self.fullname.strip!
    self.fullname.gsub!(/\s{2,}/, ' ')
  end


end
