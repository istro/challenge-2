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
      tag = Tag.find_or_create_by(text: tag_text)
      tag.entities << @entity
    end

    outdated_tags.each do |text|
      Tag.find_by_text(text).destroy
    end

    render nothing: true, status: :ok
  end

  def show
    result = {}
    entity = Entity.where(
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
    entity = Entity.where(
      entity_identifier: params[:entity_id],
      text: params[:entity_type]
    ).last
    if (entity)
      # not sure why, but doing `clone` or `dup` on array of tags did not
      # preserve them in this var after the entity got destroyed.
      tags = []
      tags += entity.tags
      entity.destroy
      remove_orphaned_tags(tags)
    end
    render nothing: true, status: :ok
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

  def remove_orphaned_tags(tags)
    tags.each do |tag|
      tag.destroy if tag.entities.length == 0
    end
  end
end
