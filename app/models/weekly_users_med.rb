class WeeklyUsersMed < UsersMed

  def days_remaining(date = Date.today)
    days_supply = (num_doses/freq_unit.size) * 7
    days_diff = (start - date).to_i
    days_supply + days_diff
  end

  def add_to_chart
    days_of_week_to_take_meds = freq_unit.map(&:to_i)
    start.upto(start + days_remaining(start).days) do |day|
      if days_of_week_to_take_meds.include?(day.wday)
        datetime = dose_datetime(day)
        Chart.create(user_id: user_id, med_id: med_id, taken_at: datetime)
      end
    end
  end

end
