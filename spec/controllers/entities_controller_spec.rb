require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do

  describe '#create' do
    describe 'new entity' do
      let(:params) do
        {
          format: :json,
          entity_id: 'bubcrowd',
          entity_type: 'typo',
          tags: ['non-critical', 'bugs']
        }
      end

      it 'creates a new entity with type from params' do
        expect do
          post(:create, params)
        end.to change(Entity, :count).by(1)
      end

      it 'creates new tags from params' do
        expect do
          post(:create, params)
        end.to change(Tag, :count).by(2)
      end

      it 'associates new tags with new entity' do
        post(:create, params)

        entity = Entity.where(
          entity_identifier: params[:entity_id],
          text: params[:entity_type]
        ).last

        tags = entity.tags.collect(&:text)
        expect(tags).to eq(params[:tags])
      end
    end
    describe 'existing entity' do
      it 'does not create a new entity'
      it 'removes old tags if they are not present in current params'
      it 'does not remove old tags if they are present in current params'
      it 'creates new tags if there are any new ones'
    end
  end

  describe '#show' do
    before(:each) do
      # create two entities, one with tags, one without
    end

    it 'returns the entity if one is found'
    it 'returns an empty object if there is not one found'
    it 'returns associated tags if there are any'
    it 'returns no tags if there are none associated'
  end

  describe '#destroy' do
    before(:each) do
      # create two entities with some shared and some exclusive tags
    end

    it 'deletes the entity'
    it 'deletes all tags exclusive to that entity'
    it 'does not delete tags shared by other entities'
  end
end
