# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Ashanti')
    @entity = Entity.new(id: 1, user: @user, amount: 1, name: 'Books')
  end

  it 'name must not be blank' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = '32hmfs'
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = 1
    expect(@entity).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end
