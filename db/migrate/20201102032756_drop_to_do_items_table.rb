class DropToDoItemsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :to_do_items
  end
end
