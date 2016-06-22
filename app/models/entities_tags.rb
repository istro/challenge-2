class EntitiesTags < ActiveRecord::Base
  belongs_to :entity
  belongs_to :tag
end

