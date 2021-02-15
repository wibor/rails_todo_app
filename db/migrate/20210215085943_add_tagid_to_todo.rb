class AddTagidToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :tag_id, :integer
  end
end
