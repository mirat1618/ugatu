require 'rails_helper'

RSpec.describe Department, type: :model do
  before(:each) do
    @department = build(:department)
  end

  describe 'validation testing' do
    it 'is valid with a valid title and abbreviation' do
      expect(@department).to be_valid
    end

    it 'has a unique title and abbreviation' do
      @department.save!
      department_duplicate = @department.dup
      expect(department_duplicate).to_not be_valid
      expect(department_duplicate.errors[:title][0]).to include('уже существует')
      expect(department_duplicate.errors[:abbreviation][0]).to include('уже существует')
    end

    it 'is not valid with Latin characters in title and abbreviation' do
      @department.title = 'Computational Mathematics'
      @department.abbreviation = 'CM'
      expect(@department).to_not be_valid
      expect(@department.errors[:title][0]).to include('кириллические')
      expect(@department.errors[:abbreviation][0]).to include('кириллические')
    end

    it 'is not valid with numbers in title and abbreviation' do
      @department.title = 'Вычислительной математики и кибернетики999'
      @department.abbreviation = 'ВМиК999'
      expect(@department).to_not be_valid
      expect(@department.errors[:title][0]).to include('кириллические')
      expect(@department.errors[:abbreviation][0]).to include('кириллические')
    end

    it 'is not valid with too long title and abbreviation' do
      @department.title = 'Ф' * 201
      @department.abbreviation = 'Ф' * 16
      expect(@department).to_not be_valid
      expect(@department.errors[:title][0]).to include('больше')
      expect(@department.errors[:abbreviation][0]).to include('больше')
    end
  end

  describe 'callbacks testing' do
    it 'has a normalized title after creation' do
      @department.title = '  Вычислительной  математики  и кибернетики  '
      @department.save!
      expect(@department.title).to eq('Вычислительной математики и кибернетики')
    end
  end
end
