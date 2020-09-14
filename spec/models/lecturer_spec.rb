require 'rails_helper'

RSpec.describe Lecturer, type: :model do
  it 'is valid with fullname' do
    user = Lecturer.new(fullname: 'Давлетов Финат Ильшатович')
    expect(user).to be_valid
  end

  it 'is not valid with numbers in fullname' do
    user = Lecturer.new(fullname: 'Давлетов Финат Ильшатович999')
    expect(user).not_to be_valid
    expect(user.errors[:fullname]).to include('Используйте кириллические символы/пробел/тире/дефис')
  end

  it 'is not valid wit Latin characters in fullname' do
    user = Lecturer.new(fullname: 'Davletov Finat Ilshatovich')
    expect(user).not_to be_valid
    expect(user.errors[:fullname]).to include('Используйте кириллические символы/пробел/тире/дефис')
  end

  it 'is not valid without any fullname' do
    user = Lecturer.new(fullname: '')
    expect(user).not_to be_valid
    expect(user.errors[:fullname]).to include('Используйте кириллические символы/пробел/тире/дефис')
  end

  it 'should normalize fullname' do
    user = Lecturer.create(fullname: '   Давлетов   Финат  Ильшатович   ')
    expect(user.fullname).to eq('Давлетов Финат Ильшатович')
  end
end
