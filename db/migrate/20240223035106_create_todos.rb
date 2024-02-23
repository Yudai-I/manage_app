class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.text :task, null: false
      t.boolean :is_completed, null: false, default: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
