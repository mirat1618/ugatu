RSpec.shared_context 'user auth token header' do
  before(:all) do
    user = create(:user)
    @headers = { 'Authorization' => "Token token=#{user.auth_token}" }
  end
end