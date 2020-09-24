class UniversityGroupsController < ApplicationController
  before_action :set_university_group, only: [:show, :edit, :update, :destroy]
  def index
    @university_groups = UniversityGroup.all
  end

  def new
    @university_group = UniversityGroup.new
  end

  def edit
    @lecturers = Lecturer.all.order('fullname ASC')
  end

  def create
    @university_group = UniversityGroup.new(university_group_params)
    if @university_group.save
      flash[:success] = 'Учебная группа создана'
      redirect_to @university_group
    else
      flash[:danger] = @university_group.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def show
  end

  def update
    p university_group_params[:lecturer_ids]
    if @university_group.update(university_group_params)
      flash[:success] = 'Данные учебной группы обновлены'
      redirect_to @university_group
    else
      flash[:danger] = @university_group.errors.full_messages.to_sentence
      redirect_to university_groups_path
    end
  end

  def destroy
    if @university_group.destroy
      flash[:success] = 'Учебная группа удалена'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to university_groups_path
  end

  private
    def insert_faculty(university_group)
      university_group.faculty = @university_group.department.faculty
    end

    def set_university_group
      @university_group = UniversityGroup.find_by(id: params[:id])
    end

    def university_group_params
      params.require(:university_group).permit(:title, :faculty_id, :department_id, lecturer_ids: [])
    end
end
