class DropTodoItemsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :todo_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
