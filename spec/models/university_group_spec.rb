require 'rails_helper'

RSpec.describe UniversityGroup, type: :model do
  before(:each) do
    @group = build(:university_group)
  end

  describe 'validation testing' do
    it 'is valid with a valid title' do
      expect(@group).to be_valid
    end

    it 'has a unique title' do
      @group.save!
      group_duplicate = @group.dup
      expect(group_duplicate).to_not be_valid
      expect(group_duplicate.errors[:title][0]).to include('уже существует')
    end

    it 'is not valid with Latin characters in title' do
      @group.title = 'Computational Mathematics'
      expect(@group).to_not be_valid
      expect(@group.errors[:title][0]).to include('кириллические')
    end

    it 'is not valid with too long title' do
      @group.title = 'Ф' * 13
      expect(@group).to_not be_valid
      expect(@group.errors[:title][0]).to include('больше')
    end
  end
end
