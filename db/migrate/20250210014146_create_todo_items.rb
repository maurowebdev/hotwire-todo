class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.string :name
      t.references :todo_list, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
