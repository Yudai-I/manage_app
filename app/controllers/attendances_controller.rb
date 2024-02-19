class AttendancesController < ApplicationController
    def attendance
    end

    def start_time
    end

    def end_time
    end

    private
    def time_params
      params.require(:attendance).permit(:start_time, :end_time, :status)
    end
end
