class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :user_id, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.integer :start_time_hour, null: false
      t.integer :start_time_minute, null: false
      t.integer :end_time_hour, null: false
      t.integer :end_time_minute, null: false

      t.timestamps
    end
  end
end
