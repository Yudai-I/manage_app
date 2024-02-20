require 'date'
class AttendancesController < ApplicationController
    def attendance
      start_date = Time.new(2024, 2, 1).beginning_of_month
      end_date = Time.new(2024, 2, 1).end_of_month
      @dates_in_february_2024 = (start_date.to_date..end_date.to_date).map do |date|
        { date: date, day_of_week: formatting_week(date.strftime("%A")) }
      end
    end

    def start_time
    end

    def end_time
    end

    private
    def time_params
      params.require(:attendance).permit(:start_time, :end_time, :status)
    end

    def formatting_week(week)
      weeks = {
        :Sunday => "日曜日",
        :Monday => "月曜日",
        :Tuesday => "火曜日",
        :Wednesday => "水曜日",
        :Thursday => "木曜日",
        :Friday => "金曜日",
        :Saturday => "土曜日"
      }
      return weeks[week.to_sym]
    end
end
