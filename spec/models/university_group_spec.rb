require 'rails_helper'

RSpec.describe UniversityGroup, type: :model do
  before(:each) do
    @faculty = Faculty.create(title: 'Информатики и робототехники', abbreviation: 'ФИРТ')
    @department = @faculty.departments.new(title: 'Вычислительной математики и кибернетики', abbreviation: 'ВМиК')
    @group = UniversityGroup.new(title: 'БИБ-104', faculty: @faculty, department: @department)
  end

  it 'is valid with a valid title' do
    expect(@group).to be_valid
  end

  it 'has a unique title' do
    @group.save!
    group_duplicate = UniversityGroup.new(title: 'БИБ-104', faculty: @faculty, department: @department)
    expect(group_duplicate).not_to be_valid
    expect(group_duplicate.errors[:title][0]).to include('уже существует')
  end

  it 'is not valid with Latin characters in title' do
    @group.title = 'Computational Mathematics'
    expect(@group).not_to be_valid
    expect(@group.errors[:title][0]).to include('кириллические')
  end

  it 'is not valid with too long title' do
    @group.title = 'Ф' * 13
    expect(@group).not_to be_valid
    expect(@group.errors[:title][0]).to include('больше')
  end
end
