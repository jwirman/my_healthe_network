class HourlyUsersMed < UsersMed

  def days_remaining(date = Date.today)
    days_supply = num_doses / (24/frequency_number)
    days_diff = (start - date).to_i
    days_supply + days_diff
  end

  def add_to_chart
    end_datetime = dose_datetime + (num_doses * frequency_number).hours
    (dose_datetime.to_i .. end_datetime.to_i).step(frequency_number.hours) do |datetime|
      Chart.create(user_id: user_id, med_id: med_id, taken_at: Time.at(datetime))
    end
  end

end
