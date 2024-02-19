class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :status, null: false, default: false
      t.timestamps
    end
  end
end
