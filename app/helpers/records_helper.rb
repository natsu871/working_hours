module RecordsHelper
  def calc_times(started_at, ended_at, break_time)
    if started_at.presence && ended_at.presence
      secs = ended_at - started_at - break_time.hours
    end
  end

  def format_hours_and_mins(secs)
    if secs.presence
        hours = secs.abs.divmod(60 * 60)
        mins = hours[1].divmod(60)
      if secs >= 0
        "#{hours[0].to_i} h #{mins[0].to_i} m"
      else
        "-#{hours[0].to_i} h #{mins[0].to_i} m"
      end
    end
  end

  def valid_count
    Record.where('started_at is not null').where('ended_at is not null').count
  end

  def calc_margin(secs)
    secs - (60 * 60 * 8 * valid_count)
  end
end
