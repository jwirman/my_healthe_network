module ApplicationHelper
  def short_weekday_short_month_day_year(date)
    date.try(:strftime, Date::DATE_FORMATS[:short_weekday_short_month_day_year])
  end

  def short_month_day_year(date)
    date.try(:strftime, Date::DATE_FORMATS[:short_month_day_year])
  end

  def hour_minute_ampm(time)
    time.try(:strftime, Time::DATE_FORMATS[:hour_minute_ampm])
  end

  def date_time(datetime)
    datetime.try(:strftime, Date::DATE_FORMATS[:date_time])
  end
end
