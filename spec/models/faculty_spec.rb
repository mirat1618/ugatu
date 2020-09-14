require 'rails_helper'

RSpec.describe Faculty, type: :model do
  it 'is valid with valid title and abbreviation' do
    faculty = Faculty.new(title: 'Информатики и робототехники', abbreviation: 'ФИРТ')
    expect(faculty).to be_valid
  end

  it 'is should has unique title and abbreviation' do
    faculty_original = Faculty.create(title: 'Информатики и робототехники', abbreviation: 'ФИРТ')
    faculty_duplicate = Faculty.new(title: 'Информатики и робототехники', abbreviation: 'ФИРТ')
    expect(faculty_duplicate).not_to be_valid
    expect(user.errors[:fullname]).to include('Используйте кириллические символы/пробел/тире/дефис')
  end
end