require 'rails_helper'

RSpec.describe "Questionnaires", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'

  before(:all) do
    @university_group = create(:university_group)
    @discipline = create(:discipline)
    @lecturer = create(:lecturer)
  end

  it 'creates a questionnaire' do
    params = { questionnaire: { first_question: 5,
                                second_question: 4,
                                third_question: 3,
                                fourth_question: 2,
                                fifth_question: 1,
                                sixth_question: 5,
                                seventh_question: 55,
                                university_group_id: @university_group.id,
                                lecturer_id: @lecturer.id,
                                discipline_id: @discipline.id
                              }

    }
    post v1_questionnaires_path, headers: @headers, params: params
    expect(response).to have_content_type(:json)
    expect(response.body).to include('Анкета принята')
  end
end
