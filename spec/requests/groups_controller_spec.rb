RSpec.describe GroupsController, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'ashanti', email: 'ashanti@gmail.com', password: 'sfhdjgjabjbge') }

  describe 'GET /index' do
    context 'when page is opened ' do
      it 'return a correct response' do
        sign_in user
        get '/'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
    end

    context 'when page is opened ' do
      before :each do
        sign_in user
      end
      it 'return a correct response' do
        get '/groups/new'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end
end
