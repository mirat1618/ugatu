class SiteController < ApplicationController
  def show_next_options
    model = params[:model]
    model_id = params[:model_id]
    @parent_form_group_id = params[:parent_form_group_id]

    case model
    when 'faculty'
      options = Faculty.find_by(id: model_id).departments
    when 'department'
      options = Department.find_by(id: model_id).university_groups
    end

    @options_partial = ApplicationController.render(partial: 'site/options', locals: {
        options: options
    })

    respond_to do |format|
      format.js
    end
  end

  def show_start_button
    university_group = UniversityGroup.find_by(id: params[:university_group_id])
    lecturers_count = university_group.lecturers.count
    disabled = true if lecturers_count == 0
    @start_button_partial = ApplicationController.render(partial: 'site/start_button', locals: {
        university_group: university_group,
        lecturers_count: lecturers_count,
        disabled: disabled
    })

    respond_to do |format|
      format.js
    end
  end

  def start_testing
    @university_group = UniversityGroup.find(params[:university_group_id])
    session[:lecturers_ids] = @university_group.lecturers.ids
    session[:university_group_id] = @university_group.id

    respond_to do |format|
      format.js
    end
  end

  def show_stats
    calculation_type = params[:calculation_type]
    lecturer_id = params[:lecturer_id]
    lecturer = Lecturer.find_by(id: lecturer_id)
    lecturer_questionnaires = lecturer.questionnaires
    disciplines = params[:discipline_id] == '' ? lecturer.disciplines.ids : [params[:discipline_id]] # if no particular discipline selected then select all lecturer's disciplines

    calculations = { first_question: [nil, Hash.new(0)], second_question: [nil, Hash.new(0)],
                     third_question: [nil, Hash.new(0)], fourth_question: [nil, Hash.new(0)],
                     fifth_question: [nil, Hash.new(0)], sixth_question: [nil, Hash.new(0)],
                     seventh_question: [nil, Hash.new(0)] }



    case calculation_type
    when 'average'
      calculations.each do |question, value|
        calculations[question][0] = lecturer_questionnaires.where(discipline_id: disciplines)
                                                         .average(question)
                                                         .to_f.round(3)
      end
    when 'median'
      calculations.each do |question, value|
        calculations[question][0] = lecturer_questionnaires.where(discipline_id: disciplines)
                                                         .median(question)
                                                         .to_f.round(3)
      end
    end


    sum = 0
    calculations.each do |question, array|
      next if question == :seventh_question
      sum += array[0]
    end
    average = (sum / 6.0).round(3)


    calculations.each do |question, array|
      lecturer_questionnaires.pluck(question).each do |record_value|
         calculations[question][1][record_value] += 1
      end
    end

    p calculations[:first_question][1]

    @stats_partial = ApplicationController.render(partial: 'lecturers/stats_table', locals: {
                                                                                    calculations: calculations,
                                                                                    average: average })

    main_pie_chart_hash = {}
    calculations.each.with_index(1) do |(question, array), index|
      next if question == :seventh_question
      main_pie_chart_hash[index] = array[0]
    end
    p main_pie_chart_hash
    @main_pie_chart = ApplicationController.render(partial: 'lecturers/pie_chart', locals: {
                                                                                    values_hash: main_pie_chart_hash,
                                                title: 'Общее', id: 'main'})
    @other_pie_charts = {}
    calculations.each.with_index(1) do |(question, array), index|
      @other_pie_charts[question] = ApplicationController.render(partial: 'lecturers/pie_chart', locals: {
          values_hash: array[1],
          title: index, id: "pie#{index}"})
    end
    #
    # p @other_pie_charts[:first_question]
    respond_to do |format|
      format.js
    end
  end

  private
    def site_params
      params.require(:site).permit(:faculty_id, :department_id, :university_group_id)
    end
end
