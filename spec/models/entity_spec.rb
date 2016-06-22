require 'rails_helper'

RSpec.describe Entity, type: :model do
  context 'associations' do
    it { should have_and_belong_to_many(:tags) }
  end
end
