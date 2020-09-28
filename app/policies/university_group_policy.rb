class UniversityGroupPolicy < ApplicationPolicy
  def index?
    user.guest? || user.analyst? || user.admin?
  end

  def create?
    user.analyst? || user.admin?
  end

  def update?
    create?
  end

  def new?
    create?
  end

  def show?
    index?
  end

  def destroy?
    user.admin?
  end
end