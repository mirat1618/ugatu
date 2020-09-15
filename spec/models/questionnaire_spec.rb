require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  before(:each) do
    @questionnaire = build(:questionnaire)
  end

  describe 'validation testing' do
    it 'is valid with valid values' do
      expect(@questionnaire).to be_valid
    end

    it 'is not valid with decimal values' do
      @questionnaire.second_question = 1.25
      @questionnaire.seventh_question = 1.25
      expect(@questionnaire).to_not be_valid
      expect(@questionnaire.errors[:second_question][0]).to include('целым')
      expect(@questionnaire.errors[:seventh_question][0]).to include('целым')
    end

    it 'is not valid with string values' do
      @questionnaire.second_question = 'string value'
      @questionnaire.seventh_question = 'string value'
      expect(@questionnaire).to_not be_valid
      expect(@questionnaire.errors[:second_question][0]).to include('целым')
      expect(@questionnaire.errors[:seventh_question][0]).to include('целым')
    end

    it 'is not valid with values out of range' do
      @questionnaire.second_question = 6
      @questionnaire.seventh_question = 5
      expect(@questionnaire).to_not be_valid
      expect(@questionnaire.errors[:second_question][0]).to include('значение')
      expect(@questionnaire.errors[:seventh_question][0]).to include('значение')
    end
  end
end
