class Questionnaire < ApplicationRecord
  belongs_to :lecturer
  belongs_to :university_group
  belongs_to :discipline
end
