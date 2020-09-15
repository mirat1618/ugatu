require 'rails_helper'

RSpec.describe Lecturer, type: :model do
  before(:each) do
    @lecturer = build(:lecturer)
  end

  describe 'validation testing' do
    it 'is valid with a fullname' do
      expect(@lecturer).to be_valid
    end

    it 'is not valid with numbers in fullname' do
      @lecturer.fullname = 'Давлетов Финат Ильшатович999'
      expect(@lecturer).to_not be_valid
      expect(@lecturer.errors[:fullname][0]).to include('кириллические')
    end

    it 'is not valid with Latin characters in fullname' do
      @lecturer.fullname = 'Davletov Finat Ilshatovich'
      expect(@lecturer).to_not be_valid
      expect(@lecturer.errors[:fullname][0]).to include('кириллические')
    end

    it 'is not valid without any fullname' do
      @lecturer.fullname = ''
      expect(@lecturer).to_not be_valid
      expect(@lecturer.errors[:fullname][0]).to include('кириллические')
    end
  end

  describe 'callbacks testing' do
    it 'has a normalized fullname after creation' do
      @lecturer = Lecturer.create(fullname: '   Давлетов   Финат  Ильшатович   ')
      expect(@lecturer.fullname).to eq('Давлетов Финат Ильшатович')
    end
  end
end
