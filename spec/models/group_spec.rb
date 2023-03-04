require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Ashanti')
    @group = Group.new(id: 1, user: @user, name: 'Business', icon: 'https://letschillll.com')
  end

  it 'name must not be blank' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @group.icon = '32dfdfd'
    expect(@group).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
