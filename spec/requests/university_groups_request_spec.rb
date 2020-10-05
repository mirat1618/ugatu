require 'rails_helper'

RSpec.describe "UniversityGroups", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'

  before(:all) do
    @university_group = create(:university_group)
  end

  it 'returns university groups list' do
    get v1_university_groups_path, headers: @headers
    expect(response).to have_content_type(:json)
    expect(response.body).to include('attributes')
  end

  it 'returns a university group' do
    get v1_university_groups_path(@lecturer), headers: @headers
    expect(response).to have_content_type(:json)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"][0]["id"]).to eq(@university_group.id.to_s)
  end
end
