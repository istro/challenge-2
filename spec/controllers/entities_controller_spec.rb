require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do

  describe '#create' do
    describe 'new entity' do
      it 'creates a new entity with type from params'
      it 'creates new tags from params'
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
