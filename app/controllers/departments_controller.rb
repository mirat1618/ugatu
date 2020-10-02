class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit
    @lecturers = Lecturer.all.order('fullname ASC')
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = 'Факультет создан'
      redirect_to @department
    else
      flash[:danger] = @department.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def show
  end

  def update
    if @department.update(department_params)
      flash[:success] = 'Данные кафедры обновлены'
      redirect_to @department
    else
      flash[:danger] = @department.errors.full_messages.to_sentence
      redirect_to edit_department_path(@department)
    end
  end

  def destroy
    if @department.destroy
      flash[:success] = 'Кафедра удалена'
    else
      flash[:danger] = @department.errors.full_messages.to_sentence
    end
    redirect_to departments_path
  end

  private
    def set_department
      @department = Department.find_by(id: params[:id])
    end

    def department_params
      params.require(:department).permit(:title, :abbreviation, :faculty_id, lecturer_ids: [])
    end
end
