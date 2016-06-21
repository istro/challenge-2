class AddEntityIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :entity_id, :integer
  end
end
