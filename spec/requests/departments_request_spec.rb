require 'rails_helper'

RSpec.describe "Departments", type: :request do
  include_context 'user auth token header'
  include_context 'clean the database'
  before(:all) do
    @department = create(:department)
  end

  it 'returns departments list' do
    get v1_departments_path, headers: @headers
    expect(response).to have_content_type(:json)
    expect(response.body).to include('attributes')
  end

  it 'returns a department' do
    get v1_departments_path(@lecturer), headers: @headers
    expect(response).to have_content_type(:json)
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"][0]["id"]).to eq(@department.id.to_s)
  end
end
