# == Schema Information
#
# Table name: users_meds
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  med_id       :integer
#  freq         :string(255)
#  freq_unit    :string(255)
#  num_per_dose :integer
#  start        :date
#  first_dose   :time
#  second_dose  :time
#  third_dose   :time
#  fourth_dose  :time
#  fifth_dose   :time
#  sixth_dose   :time
#  window       :integer          default(5), not null
#  num_doses    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class UsersMed < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  belongs_to :user
  belongs_to :med

  # validations ...............................................................
  validates :med_id, presence: true, allow_blank: false
  validates :start, presence: true, allow_blank: false
  validates :num_per_dose, allow_nil: true,
                           numericality: { greater_than: 0, only_integer: true }
  validates :num_doses, presence: true,
                        allow_blank: false,
                        numericality: { greater_than: 0, only_integer: true }
  validates :freq, presence: true,
                   allow_blank: false,
                   inclusion: { in: Med::FREQUENCIES.values }
  validates :freq_unit, allow_nil: false,
                        allow_blank: true,
                        inclusion: { in: Med::FREQUENCY_UNITS +
                                         Med::FREQUENCY_UNITS_DAY +
                                         Med::FREQUENCY_UNITS_HOUR +
                                         Med::FREQUENCY_UNITS_MEALS }
  validates :window, presence: true,
                     allow_blank: false,
                     inclusion: { in: Med::WINDOWS.map{|str| str.to_i} }
  validate :freq_has_correct_freq_unit

  def freq_has_correct_freq_unit
    if freq
      allowed_units = Med.units_from_freq(freq)
      unless allowed_units.include?(freq_unit)
        errors.add(:freq_unit, 'is not valid')
      end
    end
  end

  # callbacks .................................................................
  # scopes ....................................................................
  scope :between, -> (start_date, end_date) {
    where("start >= ? AND start <= ?", start_date, end_date)
  }

  # additional config .........................................................
  # class methods .............................................................
  # public instance methods ...................................................
  def dose_times
    array_of_dose_times = [first_dose]

    if freq_unit == 'daily' and freq =~ /time/
      num = /\d/.match(freq)[0].to_i
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

  def dose_datetime_window(date=start, dose=1)
    case dose
      when 1 then time = first_dose
      when 2 then time = second_dose
      when 3 then time = third_dose
      when 4 then time = fourth_dose
      when 5 then time = fifth_dose
      when 6 then time = sixth_dose
      else time = first_dose
    end
    dt = DateTime.new(date.year, date.month, date.day,
                      time.hour, time.min, time.sec)
    [dt - window.minutes, dt + window.minutes]
  end

  (Med::FREQUENCY_UNITS + Med::FREQUENCY_UNITS_DAY + Med::FREQUENCY_UNITS_HOUR + Med::FREQUENCY_UNITS_MEALS).each do |unit|
    define_method("#{unit}?") { freq_unit == unit }
  end

  def days_remaining
    if digit = /\d+/.match(freq)
      num = digit[0].to_i
    end
    case
      when daily?
        days_supply = (num_doses/num)
      when weekly?
        days_supply = (num_doses/num) * 7
      when monthly?
        days_supply = (num_doses/num) * 30
      when day?
        days_supply = (num_doses * 2) # "every other day"
      when hours?
        days_supply = (num_doses / (24/num))
      else
        days_supply = num_doses
    end
    days_diff = (start - Date.today).to_i
    days_supply + days_diff
  end

  def event_data
    if digit = /\d+/.match(freq)
      num = digit[0].to_i
    end
    events = []
    case
      when daily?
        start.upto(start.end_of_month) do |day|
          1.upto(num) do |i|
            start, finish = dose_datetime_window(day, i)
            events << { id: id,
                        title: med.to_s,
                        start: start,
                        end: finish,
                        allDay: false }
          end
        end
      when weekly?
      when monthly?
      when day?
      when hours?
    end
    events
  end

  # protected instance methods ................................................
  # private instance methods ..................................................

end
