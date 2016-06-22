class EntitiesController < ApplicationController
  respond_to :json

  def create
    entity_params = {
      text: params[:entity_type],
      entity_identifier: params[:entity_id]
    }
    @entity = Entity.find_or_create_by(entity_params)

    outdated_tags = tags_to_remove(entity: @entity, new_tag_list: params[:tags])
    new_tags = tags_to_create(entity: @entity, new_tag_list: params[:tags])

    new_tags.each do |tag_text|
      tag = Tag.create(text: tag_text)
      tag.entities << @entity
    end

    outdated_tags.each do |text|
      Tag.find_by_text(text).destroy
    end

    render nothing: true, status: :ok
  end

  def show
    result = {}
    entity = Entity.includes(:tags).where(
      entity_identifier: params[:entity_id],
      text: params[:entity_type]
    ).last
    if (entity)
      result = {
        entity: entity,
        tags: entity.tags
      }
    end
    render json: result, status: :ok
  end

  def destroy
  end

  private

  def tags_to_remove(entity:, new_tag_list:)
    old_tags = entity.tags.collect(&:text)
    old_tags - new_tag_list
  end

  def tags_to_create(entity:, new_tag_list:)
    old_tags = entity.tags.collect(&:text)
    new_tag_list - old_tags
  end
end
