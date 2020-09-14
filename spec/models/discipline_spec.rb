require 'rails_helper'

RSpec.describe Discipline, type: :model do
  before(:each) do
    @discipline = Discipline.new(title: 'Газогидродинамика')
  end

  it 'is valid with a valid title' do
    expect(@discipline).to be_valid
  end

  it 'has a unique title' do
    @discipline.save!
    discipline_duplicate = Discipline.new(title: 'Газогидродинамика')
    expect(discipline_duplicate).not_to be_valid
    expect(discipline_duplicate.errors[:title][0]).to include('уже существует')
  end

  it 'is not valid with Latin characters in title' do
    @discipline.title = 'Gas Hydrodynamics'
    expect(@discipline).not_to be_valid
    expect(@discipline.errors[:title][0]).to include('кириллические')
  end

  it 'has a normalized title after creation' do
    @discipline.title = '  Газо  гидродинамика  '
    @discipline.save!
    expect(@discipline.title).to eq('Газо гидродинамика')
  end
end
