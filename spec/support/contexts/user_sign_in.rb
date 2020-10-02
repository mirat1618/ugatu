RSpec.shared_context 'user sign in' do
  before(:each) do
    @user = create(:user)
    @user.analyst!
    sign_in @user
  end
end