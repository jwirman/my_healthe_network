class MonthlyUsersMed < UsersMed

  def days_remaining(date = Date.today)
    # first get number of days remaining from start date
    days_from_start = 0
    current_date = start
    n = num_doses
    while n > 0
      current_date.upto(current_date.end_of_month) do |day|
        if freq_unit.include?(day.mday.to_s)
          n -= 1
        end
        days_from_start += 1 if n > 0
      end
      current_date = current_date.next_month.beginning_of_month
    end
    # then adjust for difference between date passed in and start date
    days_diff = (start - date).to_i
    days_from_start + days_diff
  end

  def add_to_chart
    days_of_month_to_take_meds = freq_unit.map(&:to_i)
    start.upto(start + days_remaining(start).days) do |day|
      if days_of_month_to_take_meds.include?(day.mday)
        datetime = dose_datetime(day)
        Chart.create(user_id: user_id, med_id: med_id, taken_at: datetime)
      end
    end
  end

end
