class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end


  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:success] = 'Факультет создан'
      redirect_to @faculty
    else
      flash[:danger] = 'Произошла ошибка'
      render action: :new
    end
  end

  def show
  end

  def update
    if @faculty.update
      flash[:success] = 'Данные факультета обновлены'
      redirect_to @faculty
    else
      flash[:danger] = 'Произошла ошибка'
      redirect_to edit_faculty_path(@faculty)
    end
  end

  def destroy
    if @faculty.destroy
      flash[:success] = 'Факультет удален'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to faculties_path
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:title, :abbreviation)
    end
end
