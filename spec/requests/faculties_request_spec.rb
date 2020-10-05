require 'rails_helper'

RSpec.describe "Faculties", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'

  before(:all) do
    @faculty = create(:faculty)
  end

  it 'returns faculties list' do
    get v1_faculties_path, headers: @headers
    expect(response).to have_content_type(:json)
    expect(response.body).to include('attributes')
  end

  it 'returns a faculty' do
    get v1_faculties_path(@lecturer), headers: @headers
    expect(response).to have_content_type(:json)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"][0]["id"]).to eq(@faculty.id.to_s)
  end
end
