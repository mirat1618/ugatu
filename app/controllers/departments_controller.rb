class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end
  def edit
  end

  def create
    @department = Department.new(faculty_params)
    if @department.save
      flash[:success] = 'Факультет создан'
      redirect_to @department
    else
      flash[:danger] = 'Произошла ошибка'
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
      flash[:danger] = 'Произошла ошибка'
      redirect_to edit_department_path(@department)
    end
  end

  def destroy
    if @department.destroy
      flash[:success] = 'Кафедра удалена'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to edit_department_path(@department)
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:title, :abbreviation, :faculty_id)
  end
end
