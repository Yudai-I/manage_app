class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :user_id, null: false
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :start_time_hour
      t.integer :start_time_minute
      t.integer :end_time_hour
      t.integer :end_time_minute

      t.timestamps
    end
  end
end
