# frozen_string_literal: true

class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @groups = Group.where(user: current_user)
    @group_lists = []
    @group = Group.find(params[:group_id])
    @group_lists << @group
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entities_params)
    @entity.user = current_user

    if @entity.save
      @group_entity = EntityGroup.create(entity: @entity, group_id: params[:group])
      redirect_to group_path(id: params[:group_id])
    else
      render :new
    end
  end

  def entities_params
    params.require(:entity).permit(:name, :amount, :group)
  end
end
