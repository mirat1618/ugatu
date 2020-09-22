class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  def index
    @lecturers = Lecturer.all
  end

  def new
    @lecturer = Lecturer.new
  end


  def edit
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
    @lecturer = Lecturer.find(params[:id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:fullname)
  end
end
