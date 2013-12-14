class UsersMed < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :med_id, :freq, :freq_unit, :window, :start, presence: true, allow_blank: false
  validates :num_per_dose, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
  validates :num_doses,    numericality: { greater_than: 0, only_integer: true }, presence: true
  validates :freq, inclusion: { in: Med::FREQUENCIES.values }
  validates :freq_unit, inclusion: { in: Med::FREQUENCY_UNITS +
                                         Med::FREQUENCY_UNITS_DAY +
                                         Med::FREQUENCY_UNITS_HOUR +
                                         Med::FREQUENCY_UNITS_MEALS }
  validates :window, inclusion: { in: Med::WINDOWS.map{|str| str.to_i} }

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

end
