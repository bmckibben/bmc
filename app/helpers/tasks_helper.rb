module TasksHelper
  def format_duration(duration, show_hours = false)
    hours     = (duration / 3600).floor || 0
    minutes   = ((duration - hours * 3600) / 60).floor || 0
    seconds   = (duration - hours * 3600 - minutes * 60).floor || 0
    hours_s   = hours.to_s.rjust(2, '0')
    minutes_s = minutes.to_s.rjust(2, '0')
    seconds_s = seconds.to_s.rjust(2, '0')

    formatted = %(#{hours_s}:#{minutes_s}).html_safe
    if show_hours
      [formatted, (hours + minutes / 60.0).round]
    else
      formatted
    end
  end	
end
