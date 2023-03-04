# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntitiesController, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'ashanti', email: 'ashanti@gmail.com', password: 'sfhdjgjabjbge') }

  describe 'GET /index' do
    context 'when page is opened ' do
      before :each do
        sign_in user
        @group = Group.create(id: 1, user:, name: 'Business', icon: 'https://google.com.png')
      end
      it 'return a correct response' do
        get "/groups/#{@group.id}/entities/new"
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end
end
