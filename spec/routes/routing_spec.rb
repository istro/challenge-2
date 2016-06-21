require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  it 'routes POST requests for "/tags" to EntitiesController#create' do
    expected_route = { controller: 'entities', action: 'create' }
    expect(post: '/tags').to route_to(expected_route)
  end

  it 'routes GET requests with appropriate params to EntitiesController#show' do
    expected_route = {
      controller: 'entities',
      action: 'show',
      entity_type: 'bug',
      entity_id: 'crowd'
    }

    expect(get: '/tags/bug/crowd').to route_to(expected_route)
  end

  it 'routes DELETE requests for "/tags/:foo/:bar" to EntitiesController#destroy' do
    expected_route = {
      controller: 'entities',
      action: 'destroy',
      entity_type: 'squash',
      entity_id: 'bugs'
    }

    expect(delete: '/tags/squash/bugs').to route_to(expected_route)
  end
end
