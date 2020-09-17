class QuestionnairesController < ApplicationController
  def new
    flash[:danger] = 'There was an error...'
    @lecturer = Lecturer.find(37)
    @university_group = UniversityGroup.first
    @questionnaire = Questionnaire.new
    @disciplines = @lecturer.disciplines
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      flash[:success] = 'Galaxy was successfully created!'
      redirect_to @questionnaire
    else
      flash[:danger] = 'There was an error...'
      redirect_to action: new
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
