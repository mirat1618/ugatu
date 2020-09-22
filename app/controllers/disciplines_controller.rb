class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end
  def edit
  end

  def create
    @discipline = Discipline.new(discipline_params)
    if @discipline.save
      flash[:success] = 'Дисциплина создана'
      redirect_to @discipline
    else
      flash[:danger] = 'Произошла ошибка'
      render action: :new
    end
  end

  def show
  end

  def update
    if @discipline.update(discipline_params)
      flash[:success] = 'Данные дисциплины обновлены'
      redirect_to @discipline
    else
      flash[:danger] = 'Произошла ошибка'
      redirect_to edit_discipline_path(@discipline)
    end
  end

  def destroy
    if @discipline.destroy
      flash[:success] = 'Дисциплина удалена'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to edit_discipline_path(@discipline)
  end

  private
  def set_discipline
    @discipline= Discipline.find(params[:id])
  end

  def department_params
    params.require(:discipline).permit(:title)
  end
end
