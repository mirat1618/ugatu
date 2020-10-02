require 'rails_helper'

RSpec.describe "Faculties", type: :request do
  include_context 'user sign in'

  it 'shows the list of faculties' do
    get faculties_path
    expect(response).to have_content_type :html
    expect(response).to be_content_type :html # just an alias of the custom matcher
  end
end
