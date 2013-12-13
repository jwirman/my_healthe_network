class UsersMed < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :med_id, :freq, :start, presence: true, allow_blank: false
  validates :num_per_dose, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
  validates :num_doses,    numericality: { greater_than: 0, only_integer: true }, presence: true

  def dose_times
    array_of_dose_times = [first_dose]

    if (index = freq =~ /time/) and freq_unit == 'Daily'
      num = freq[0,index].strip
      case num
        when 'Two'
          array_of_dose_times << second_dose
        when 'Three'
          array_of_dose_times << second_dose
          array_of_dose_times << third_dose
        when 'Four'
          array_of_dose_times << second_dose
          array_of_dose_times << third_dose
          array_of_dose_times << fourth_dose
        when 'Five'
          array_of_dose_times << second_dose
          array_of_dose_times << third_dose
          array_of_dose_times << fourth_dose
          array_of_dose_times << fifth_dose
        when 'Six'
          array_of_dose_times << second_dose
          array_of_dose_times << third_dose
          array_of_dose_times << fourth_dose
          array_of_dose_times << fifth_dose
          array_of_dose_times << sixth_dose
      end
    end

    array_of_dose_times
  end

end
