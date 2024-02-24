class Attendance < ApplicationRecord
    belongs_to :user

    def self.get_todo_info(date, user_id)
      todos = Todo.where(date: date, user_id: user_id)
    end
end
