require 'rails_helper'

RSpec.describe Faculty, type: :model do
  before(:each) do
    @faculty = build(:faculty)
  end

  describe 'validation testing' do
    it 'is valid with a valid title and abbreviation' do
      expect(@faculty).to be_valid
    end

    it 'has a unique title and abbreviation' do
      @faculty.save!
      faculty_duplicate = @faculty.dup
      expect(faculty_duplicate).to_not be_valid
      expect(faculty_duplicate.errors[:title][0]).to include('уже существует')
      expect(faculty_duplicate.errors[:abbreviation][0]).to include('уже существует')
    end

    it 'is not valid with Latin characters in title and abbreviation' do
      @faculty.title = 'Faculty of information technologies'
      @faculty.abbreviation = 'FIRT'
      expect(@faculty).to_not be_valid
      expect(@faculty.errors[:title][0]).to include('кириллические')
      expect(@faculty.errors[:abbreviation][0]).to include('кириллические')
    end

    it 'is not valid with numbers in title and abbreviation' do
      @faculty.title = 'Информатики и робототехники999'
      @faculty.abbreviation = 'ФИРТ999'
      expect(@faculty).to_not be_valid
      expect(@faculty.errors[:title][0]).to include('кириллические')
      expect(@faculty.errors[:abbreviation][0]).to include('кириллические')
    end

    it 'is not valid with too long title and abbreviation' do
      @faculty.title = 'Ф' * 201
      @faculty.abbreviation = 'Ф' * 16
      expect(@faculty).to_not be_valid
      expect(@faculty.errors[:title][0]).to include('больше')
      expect(@faculty.errors[:abbreviation][0]).to include('больше')
    end
  end

  describe 'callbacks testing' do
    it 'has a normalized title after creation' do
      @faculty.title = '  информатики   и робототехники  '
      @faculty.save!
      expect(@faculty.title).to eq('Информатики и робототехники')
    end
  end
end