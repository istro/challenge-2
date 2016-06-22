class EntitiesController < ApplicationController
  respond_to :json

  def create
    entity_params = {
      text: params[:entity_type],
      entity_identifier: params[:entity_id]
    }
    @entity = Entity.create(entity_params)

    params[:tags].each do |tag_text|
      tag = Tag.create(text: tag_text)
      tag.entities << @entity
    end

    render nothing: true, status: :ok
  end

  def show
  end

  def destroy
  end
end
