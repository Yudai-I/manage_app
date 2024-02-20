require 'date'
class AttendancesController < ApplicationController
    def attendance
      year = params[:year].to_i
      month = params[:month].to_i
      if year == 0 and month == 0
        year = Date.current.year
        month = Date.current.month
      end
      start_date = Time.new(year, month, 1).beginning_of_month
      end_date = Time.new(year, month, 1).end_of_month
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
end
