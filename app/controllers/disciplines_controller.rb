class DisciplinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def edit
    @lecturers = Lecturer.all.order('fullname ASC')
  end

  def create
    @discipline = Discipline.new(discipline_params)
    if @discipline.save
      flash[:success] = 'Дисциплина создана'
      redirect_to @discipline
    else
      flash[:danger] = @discipline.errors.full_messages.to_sentence
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
      flash[:danger] = @discipline.errors.full_messages.to_sentence
      redirect_to edit_discipline_path(@discipline)
    end
  end

  def destroy
    if @discipline.destroy
      flash[:success] = 'Дисциплина удалена'
    else
      flash[:danger] = @discipline.errors.full_messages.to_sentence
    end
    redirect_to disciplines_path
  end

  private
    def set_discipline
      @discipline= Discipline.find_by(id: params[:id])
    end

    def discipline_params
      params.require(:discipline).permit(:title, :lecturer_id, lecturer_ids: [])
    end
end
