module ApplicationHelper
    def select_alert_subclass(input)
        case input
        when 'notice'
            return 'success'
        when 'alert'
            return 'warning'
        when 'error'
            return 'danger'
        else
            return 'info'
        end
    end

    def format_time(time, timezone = 'Melbourne', time_format = "%I:%M:%S %p %d-%m-%Y")
        return time.in_time_zone(timezone).strftime(time_format)
    end
end
