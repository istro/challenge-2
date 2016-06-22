class AddEntityIdentifierToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :entity_identifier, :string
  end
end
