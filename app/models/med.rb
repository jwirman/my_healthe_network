class Med < ActiveRecord::Base
  has_many :users, through: :users_meds

  validates :generic_name, presence: true

  def to_s
    "#{generic_name} #{strength} (#{brand_name})"
  end

  FREQUENCIES = [
    'One time',
    'Two times',
    'Three times',
    'Four times',
    'Five times',
    'Six times',
    'Every other',
    'Every one (1)',
    'Every two (2)',
    'Every three (3)',
    'Every four (4)',
    'Every five (5)',
    'Every six (6)',
    'Every seven (7)',
    'Every eight (8)',
    'Every nine (9)',
    'Every ten (10)',
    'Every eleven (11)',
    'Every twelve (12)',
    'Before',
    'After',
    'Going to Bed',
    'PRN'
  ]
  FREQUENCY_UNITS = %w[Daily Weekly Monthly]
  FREQUENCY_UNITS_DAY = %w[Day]
  FREQUENCY_UNITS_HOUR = %w[Hour(s)]
  FREQUENCY_UNITS_MEALS = %w[Breakfast Lunch Dinner Snack]

  def self.units_from_freq(frequency)
    case frequency
      when /time/
        return FREQUENCY_UNITS
      when /other/
        return FREQUENCY_UNITS_DAY
      when /\d/
        return FREQUENCY_UNITS_HOUR
      when /Before|After/
        return FREQUENCY_UNITS_MEALS
      else
        return []
    end
  end

end
