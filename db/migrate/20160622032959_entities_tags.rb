class EntitiesTags < ActiveRecord::Migration
  def change
    create_table :entities_tags, id: false do |t|
      t.belongs_to :entity, index: true
      t.belongs_to :tag, index: true
    end
  end
end
