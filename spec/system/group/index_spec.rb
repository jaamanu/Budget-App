require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'Ashanti', email: 'ashanti@gmail.com', password: 'mbshgfhgbv') }
  describe 'Index page' do
    before(:each) do
      sign_in user
      @group = Group.create(id: 1, user:, name: 'Business', icon: 'https://google.com.jpg?')
      @entity = Entity.create(id: 1, user:, amount: 13, name: 'Random')
      @entity2 = Entity.create(id: 2, user:, amount: 13, name: 'Random')
      @entity_group = EntityGroup.create(id: 1, entity: @entity, group: @group)
      @entity_group = EntityGroup.create(id: 2, entity: @entity2, group: @group)
      @total = 0
      visit root_path
    end

    it 'Should return each user with an image' do
      expect(page).to have_content(user.name.upcase)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content(@group.name.to_s)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content(@entity.amount + @entity2.amount)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content('New group')
    end

    it 'Should have a post titkle' do
      expect("#{page.current_url}/groups/new").to match new_group_path
    end

    it 'Should return each user with an image' do
      expect(page).to have_css("img[src*='#{@group.icon}']")
    end
  end
end
