# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'Ashanti', email: 'ashanti@gmail.com', password: 'sfsfsebtbewr') }
  describe 'Index page' do
    before(:each) do
      sign_in user
      @group = Group.create(id: 1, user:, name: 'Business', icon: 'https://google.com.jpg?')
      @entity = Entity.create(id: 1, user:, amount: 124, name: 'Random')
      @entity_group = EntityGroup.create(id: 1, entity: @entity, group: @group)
      @total = 0
      visit group_path(@group.id)
    end

    it 'Should return each user with an image' do
      expect(page).to have_content(@entity.name)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content(@entity.amount)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content('Back')
    end
  end
end
