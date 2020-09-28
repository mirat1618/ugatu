class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  def index
    @lecturers = Lecturer.all
  end

  def new
    @lecturer = Lecturer.new
  end


  def edit
    @university_groups = UniversityGroup.all.order('title ASC')
    @departments = Department.all.order('title ASC')
    @disciplines = Discipline.all.order('title ASC')
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      flash[:success] = 'Преподаватель создан'
      redirect_to @lecturer
    else
      flash[:danger] = 'Произошла ошибка'
      render action: :new
    end
  end

  def show
    @lecturer_questionnaires = @lecturer.questionnaires
    @lecturer_disciplines = @lecturer.disciplines
    @number_of_questionnaires = @lecturer.questionnaires.count
  end

  def update
    if @lecturer.update(lecturer_params)
      flash[:success] = 'Данные преподавателя обновлены'
      redirect_to @lecturer
    else
      flash[:danger] = 'Произошла ошибка'
      redirect_to edit_lecturer_path(@lecturer)
    end
  end

  def destroy
    if @lecturer.destroy
      flash[:success] = 'Преподаватель удален'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to lecturer_path
  end

  private
    def set_lecturer
      @lecturer = Lecturer.find_by(id: params[:id])
      authorize @lecturer
    end

    def lecturer_params
      params.require(:lecturer).permit(:fullname, university_group_ids: [], department_ids: [], discipline_ids: [])
    end
end
