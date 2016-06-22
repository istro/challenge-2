class RemoveEntityIdFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :entity_id
  end
end
