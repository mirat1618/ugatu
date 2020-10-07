class Api::V1::QuestionnairesController < Api::V1::ApiController
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      render json: 'Анкета принята.'
      ActionCable.server.broadcast 'total_count_channel', total_count: Questionnaire.count
    else
      render json: @questionnaire.errors.full_messages.to_sentence
    end
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:first_question, :second_question,
                                          :third_question, :fourth_question,
                                          :fifth_question, :sixth_question, :seventh_question,
                                          :lecturer_id, :university_group_id, :discipline_id)
  end
end

# creation query: POST localhost:3000/v1/questionnaires
# body parameters: FORM-DATA

# questionnaire[first_question]: 0..5
# questionnaire[second_question]: 0..5
# questionnaire[third_question]: 0..5
# questionnaire[fourth_question]: 0..5
# questionnaire[fifth_question]: 0..5
# questionnaire[sixth_question]: 0..5
# questionnaire[seventh_question]: 0..100
# questionnaire[university_group_id]: respective university group's id (existing one)
# questionnaire[lecturer_id]: respective lecturer's id (existing one)
# questionnaire[disciplines_id]: respective discipline's id (existing one)