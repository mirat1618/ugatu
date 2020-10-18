class SiteController < ApplicationController
  def welcome
    @total_count = Questionnaire.count
  end

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
    # if no particular discipline selected then include all lecturer's disciplines
    disciplines = params[:discipline_id] == '' ? lecturer.disciplines.ids : [params[:discipline_id]]
    number_of_questionnaires = lecturer.questionnaires.count

    summary_stats = lecturer.get_summary_stats(calculation_type, disciplines)
    average = lecturer.get_average(summary_stats)
    occurrences_stats = lecturer.get_occurrences_stats
    summary_stats_for_charts = lecturer.transform_hash_keys(summary_stats)
    occurrences_stats_for_charts = lecturer.transform_hash_keys(occurrences_stats)

    @stats_table_partial = ApplicationController.render(partial: 'lecturers/stats_table', locals: {
                                                                                    summary_stats: summary_stats,
                                                                                    average: average,
                                                                                    number_of_questionnaires: number_of_questionnaires
    })

    @summary_pie_chart_partial = ApplicationController.render(partial: 'lecturers/pie_chart', locals: {
                                                                                                values_hash: summary_stats_for_charts.except('№7'),
                                                                                                title: 'Общее',
                                                                                                id: 'summary'
    })

    @occurrences_pie_charts = []
    occurrences_stats_for_charts.except('№7').each do |question, occurrences|
      @occurrences_pie_charts << ApplicationController.render(partial: 'lecturers/pie_chart', locals: {
                                                                                                values_hash: occurrences,
                                                                                                title: "Распределение баллов по #{question}",
                                                                                                id: question
                                                                                            })
    end


    respond_to do |format|
      format.js
    end
  end
end
