require 'rails_helper'

RSpec.describe "Lecturers", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'

  before(:all) do
    @lecturer = create(:lecturer)
  end

  it 'returns lecturers list' do
    get v1_lecturers_path, headers: @headers
    expect(response).to have_content_type(:json)
    expect(response.body).to include('attributes')
  end

  it 'returns a lecturer' do
    get v1_lecturers_path(@lecturer), headers: @headers
    expect(response).to have_content_type(:json)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"][0]["id"]).to eq(@lecturer.id.to_s)
  end
end
