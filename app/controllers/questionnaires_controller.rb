class QuestionnairesController < ApplicationController
  def new
    p flash[:danger]
    if session[:lecturers_ids].empty?
      @partial = ApplicationController.render partial: 'shared/thank_you'
    else
      @questionnaire = Questionnaire.new
      @lecturer = Lecturer.find(session[:lecturers_ids].first)
      @university_group = UniversityGroup.find(session[:university_group_id])
      @disciplines = @lecturer.disciplines
      @partial = ApplicationController.render partial:'questionnaires/form', locals: {lecturer:  @lecturer,
                                                                                     disciplines: @disciplines,
                                                                                     university_group: @university_group,
                                                                                     questionnaire: @questionnaire
      }
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    flash[:danger] = nil
    @questionnaire = Questionnaire.new(questionnaire_params)
    respond_to do |format|
      if @questionnaire.save
        session[:lecturers_ids].shift
        format.html { redirect_to action: 'new'}
        format.js { @response = 'success'}
      else
        format.html { redirect_to action: 'new' }
        format.js { flash[:danger] = @questionnaire.errors.full_messages.to_sentence }
      end
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
