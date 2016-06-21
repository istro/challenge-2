class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
