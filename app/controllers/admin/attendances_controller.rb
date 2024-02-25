class Admin::AttendancesController < ApplicationController
  def attendance
    @shift = Shift.new
    @users = User.where(admin: false)
    @user_id = params[:user_id]
    @user_name = User.find(params[:user_id]).name if params[:user_id]
    year = params[:year].to_i
    month = params[:month].to_i
    @year = params[:year].to_i
    @month = params[:month].to_i
    @get_attendance_info = get_attendance_info(year, month)
  end

  def new_shift
    user_id = params[:shift][:user_id]
    @shift = Shift.new(shift_params)
    @shift.user_id = user_id
    if @shift.save
        @shift = Shift.new
        @users = User.all
        @user_id = user_id
        year = @shift.year.to_i
        month = @shift.month.to_i
        @year = @shift.year.to_i
        @month = @shift.month.to_i
        @get_attendance_info = get_attendance_info(year, month)
        flash[:notice] = "シフト作成に成功しました"
        render :attendance
    else
        flash[:notice] = "シフト作成に失敗しました"
        redirect_to admin_attendance_path
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:user_id, :year, :month, :day, :start_time_hour, :start_time_minute, :end_time_hour, :end_time_minute)
  end

  def formatting_week(week)
    weeks = {
      :Sunday => "日",
      :Monday => "月",
      :Tuesday => "火",
      :Wednesday => "水",
      :Thursday => "木",
      :Friday => "金",
      :Saturday => "土"
    }
    return weeks[week.to_sym]
  end

  def get_attendance_info(year, month)
    if year == 0 and month == 0
        year = Date.current.year
        month = Date.current.month
    end
    start_date = Time.new(year, month, 1).beginning_of_month
    end_date = Time.new(year, month, 1).end_of_month
    get_attendance_info = (start_date.to_date..end_date.to_date).map do |date|
      attendance = Attendance.find_by(start_time: date.beginning_of_day..date.end_of_day, user_id: @user_id)
      if attendance and attendance.start_time != nil and attendance.end_time != nil
        start_time = attendance.start_time.strftime("%H:%M")
        end_time = attendance.end_time.strftime("%H:%M")
      elsif attendance and attendance.end_time == nil
        start_time = attendance.start_time.strftime("%H:%M")
        end_time = nil
      else
        start_time = nil
        end_time = nil
      end
      { date: date, day_of_week: formatting_week(date.strftime("%A")), start_time: start_time, end_time: end_time }
    end
    return get_attendance_info
  end

end
