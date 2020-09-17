require 'rails_helper'

RSpec.describe UniversityGroup, type: :model do
  before(:each) do
    @university_group = build(:university_group)
  end

  describe 'validation testing' do
    it 'is valid with a valid title' do
      expect(@university_group).to be_valid
    end

    it 'has a unique title' do
      @university_group.save!
      university_group_duplicate = @university_group.dup
      expect(university_group_duplicate).to_not be_valid
      expect(university_group_duplicate.errors[:title][0]).to include('уже существует')
    end

    it 'is not valid with Latin characters in title' do
      @university_group.title = 'Computational Mathematics'
      expect(@university_group).to_not be_valid
      expect(@university_group.errors[:title][0]).to include('кириллические')
    end

    it 'is not valid with too long title' do
      @university_group.title = 'Ф' * 13
      expect(@university_group).to_not be_valid
      expect(@university_group.errors[:title][0]).to include('больше')
    end

    it 'is not valid without faculty/department association' do
      @university_group.faculty = nil
      @university_group.department = nil
      expect(@university_group).to_not be_valid
      expect(@university_group.errors[:faculty_id][0]).to include('Не указан')
      expect(@university_group.errors[:department_id][0]).to include('Не указан')
    end
  end
end
