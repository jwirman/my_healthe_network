class DailyUsersMed < UsersMed

  validates :second_dose, presence: true, allow_blank: false, if: Proc.new{ |users_med| users_med.frequency_number == 2 }
  validates :third_dose,  presence: true, allow_blank: false, if: Proc.new{ |users_med| users_med.frequency_number == 3 }
  validates :fourth_dose, presence: true, allow_blank: false, if: Proc.new{ |users_med| users_med.frequency_number == 4 }
  validates :fifth_dose,  presence: true, allow_blank: false, if: Proc.new{ |users_med| users_med.frequency_number == 5 }
  validates :sixth_dose,  presence: true, allow_blank: false, if: Proc.new{ |users_med| users_med.frequency_number == 6 }

  def dose_times
    array_of_dose_times = [first_dose]

    unless every_other_day?
      num = frequency_number
      case num
        when 2
          array_of_dose_times << second_dose
        when 3
          array_of_dose_times << second_dose << third_dose
        when 4
          array_of_dose_times << second_dose << third_dose << fourth_dose
        when 5
          array_of_dose_times << second_dose << third_dose << fourth_dose << fifth_dose
        when 6
          array_of_dose_times << second_dose << third_dose << fourth_dose << fifth_dose << sixth_dose
      end
    end

    array_of_dose_times
  end

  def dose_datetime(date=start, dose=1)
    case dose
      when 1 then time = first_dose
      when 2 then time = second_dose
      when 3 then time = third_dose
      when 4 then time = fourth_dose
      when 5 then time = fifth_dose
      when 6 then time = sixth_dose
    end
    DateTime.new(date.year, date.month, date.day,
                 time.hour, time.min, time.sec)
  end


  def days_remaining(date = Date.today)
    if every_other_day?
      days_supply = (num_doses * 2)
    else
      days_supply = num_doses/frequency_number
    end
    days_diff = (start - date).to_i
    days_supply + days_diff
  end

  def add_to_chart
    odd_or_even = 0
    start.upto(start + days_remaining(start).days - 1.day) do |day|
      if every_other_day?
        if odd_or_even.even?
          datetime = dose_datetime(day)
          Chart.create(user_id: user_id, med_id: med_id, taken_at: datetime)
        end
        odd_or_even += 1
      else
        1.upto(frequency_number) do |i|
          datetime = dose_datetime(day, i)
          Chart.create(user_id: user_id, med_id: med_id, taken_at: datetime)
        end
      end
    end
  end

  def every_other_day?
    freq =~ /other/
  end

end
