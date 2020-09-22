class UniversityGroupsController < ApplicationController
  before_action :set_university_group, only: [:show, :edit, :update, :destroy]
  def index
    @university_groups = UniversityGroup.all
  end

  def new
    @university_group = UniversityGroup.new
  end
  def edit
  end

  def create
    @university_group = UniversityGroup.new(university_group_params)
    if @university_group.save
      flash[:success] = 'Учебная группа создана'
      redirect_to @university_group
    else
      flash[:danger] = 'Произошла ошибка'
      render action: :new
    end
  end

  def show
  end

  def update
    if @university_group.update(university_group_params)
      flash[:success] = 'Данные учебной группы обновлены'
      redirect_to @university_group
    else
      flash[:danger] = 'Произошла ошибка'
      redirect_to edit_university_group_path(@university_group)
    end
  end

  def destroy
    if @university_group.destroy
      flash[:success] = 'Учебная группа удалена'
    else
      flash[:danger] = 'Произошла ошибка'
    end
    redirect_to edit_university_group_path(@university_group)
  end

  private
  def set_university_group
    @university_group = UniversityGroup.find(params[:id])
  end

  def university_group_params
    params.require(:university_group).permit(:title, :faculty_id, :department_id)
  end
end
