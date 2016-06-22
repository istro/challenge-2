require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:entities) }
  end
end
