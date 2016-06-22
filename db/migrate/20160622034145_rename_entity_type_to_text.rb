class RenameEntityTypeToText < ActiveRecord::Migration
  def change
    rename_column :entities, :type, :text
  end
end
