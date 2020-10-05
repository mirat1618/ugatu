require 'rails_helper'

RSpec.describe "Disciplines", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'

  before(:all) do
    @discipline = create(:discipline)
  end

  it 'returns disciplines list' do
    get v1_disciplines_path, headers: @headers
    expect(response).to have_content_type(:json)
    expect(response.body).to include('attributes')
  end

  it 'returns a discipline' do
    get v1_disciplines_path(@lecturer), headers: @headers
    expect(response).to have_content_type(:json)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"][0]["id"]).to eq(@discipline.id.to_s)
  end
end
