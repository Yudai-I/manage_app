class UsersController < ApplicationController
  def show
    start_date = 1.month.ago.beginning_of_month
    end_date = 1.month.ago.end_of_month
    
    attendances = Attendance.where(user_id: current_user.id, status: false, start_time: start_date..end_date)
    work_duration_sec_last_month = 0
    # 先月の総勤務時間を秒単位で取得
    attendances.each do |attendance|
      work_duration_sec_last_month += attendance.end_time - attendance.start_time
    end
    @work_duration_hours_last_month = (work_duration_sec_last_month / 3600).round(1)

  end
end
