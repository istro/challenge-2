require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  describe '#create' do
    let(:params) do
      {
        format: :json,
        entity_id: 'bubcrowd',
        entity_type: 'typo',
        tags: ['non-critical', 'bugs']
      }
    end

    describe 'new entity' do
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
      before(:each) do
        post(:create, params)
        params[:tags] = %w(security critical bugs)
        post(:create, params)
      end

      let(:entity) do
        Entity.where(
          entity_identifier: params[:entity_id],
          text: params[:entity_type]
        ).last
      end

      let(:tags) do
        entity.tags.collect(&:text)
      end

      it 'does not create a new entity' do
        expect do
          post(:create, params)
        end.to_not change(Entity, :count)
      end

      it 'removes old tags if they are not present in current params' do
        expect(Tag.find_by_text('non-critical')).to be_nil
        expect(tags).to_not include('non-critical')
      end

      it 'does not remove old tags if they are present in current params' do
        # I was looking to ensure the overlapping "bugs" tag didn't get
        # overwritten, and looked into slowing down time in rspec to ensure that
        # was the oldest of the three... There are additional gems for that, but
        # seems too complicated for current task. Earlier ID will verify that
        # well enough.
        tag_objects = entity.tags.order(:id)
        expect(tag_objects.first.text).to eq('bugs')
      end

      it 'creates new tags if there are any new ones' do
        expect(Tag.find_by_text('security')).to_not be_nil
        expect(tags).to include('security')
      end
    end
  end

  describe '#show' do
    before(:each) do
      params_1 = {
        format: :json,
        entity_id: 'lewis',
        entity_type: 'formula_1',
        tags: ['champion']
      }
      params_2 = {
        format: :json,
        entity_id: 'nico',
        entity_type: 'formula_1',
        tags: []
      }
      # not entirely sure if this is cool - relying on create action to make
      # tags... But, it's tested above, so should be okay
      post(:create, params_1)
      post(:create, params_2)
    end

    it 'returns the entity if one is found' do
      params = {
        format: :json,
        entity_id: 'lewis',
        entity_type: 'formula_1'
      }
      get(:show, params)
      returned_value = JSON.parse(response.body)
      expect(returned_value['entity']['text']).to eq(params[:entity_type])
      expect(returned_value['entity']['entity_identifier']).to eq(params[:entity_id])
    end

    it 'returns an empty object if there is no entity found' do
      params = {
        format: :json,
        entity_id: 'ivan',
        entity_type: 'formula_1'
      }
      get(:show, params)
      expect(response.body).to eq('{}')
    end

    it 'returns associated tags if there are any' do
      params = {
        format: :json,
        entity_id: 'lewis',
        entity_type: 'formula_1'
      }
      get(:show, params)
      returned_value = JSON.parse(response.body)
      expect(returned_value['tags'].length).to eq(1)

      tag = returned_value['tags'].first
      expect(tag['text']).to eq('champion')
    end

    it 'returns no tags if there are none associated' do
      params = {
        format: :json,
        entity_id: 'nico',
        entity_type: 'formula_1'
      }
      get(:show, params)
      returned_value = JSON.parse(response.body)
      expect(returned_value['tags'].length).to eq(0)
    end
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
