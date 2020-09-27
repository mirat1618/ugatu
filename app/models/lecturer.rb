class Lecturer < ApplicationRecord
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :university_groups
  has_and_belongs_to_many :disciplines
  has_many :questionnaires
  validates :fullname,
            format: { with: /\A[А-я\-—\s]+\z/, message: 'Используйте кириллические символы/пробел/тире/дефис' }
  before_create :normalize

  def get_summary_stats(calculation_type, disciplines_array)
    stats = { first_question: nil, second_question: nil, third_question: nil,
              fourth_question: nil, fifth_question: nil, sixth_question: nil,
              seventh_question: nil }
    query = "self.questionnaires.where(discipline_id: disciplines_array).#{calculation_type}(question).to_f.round(3)"
    stats.each { |question, value| stats[question] = eval(query) }
  end

  def get_average(summary_stats)
    sum = 0
    sum = summary_stats.except(:seventh_question).values.reduce(&:+)
    average = (sum / 6.0).round(3)
  end


  def get_occurrences_stats
    lecturer_questionnaires = self.questionnaires

    stats = { first_question: Hash.new(0), second_question: Hash.new(0), third_question: Hash.new(0),
              fourth_question: Hash.new(0), fifth_question: Hash.new(0), sixth_question: Hash.new(0),
              seventh_question: Hash.new(0) }

    stats.each do |question, value|
      lecturer_questionnaires.pluck(question).each { |record_value| stats[question][record_value] += 1 }
    end
  end

  def transform_hash_keys(old_hash)
    new_hash = {}
    old_hash.each.with_index(1) {|(key, value), index| new_hash["№#{index}"] = value }
    new_hash
  end


  private
  def normalize
    self.fullname.strip!
    self.fullname.gsub!(/\s{2,}/, ' ')
  end
end
