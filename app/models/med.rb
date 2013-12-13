class Med < ActiveRecord::Base
  has_many :users, through: :users_meds

  validates :generic_name, presence: true

  def to_s
    "#{generic_name} #{strength} (#{brand_name})"
  end

  FREQUENCIES = {
    # display_value => stored_value
    'One time'          => 'time_1',
    'Two times'         => 'time_2',
    'Three times'       => 'time_3',
    'Four times'        => 'time_4',
    'Five times'        => 'time_5',
    'Six times'         => 'time_6',
    'Every other'       => 'other',
    'Every one (1)'     => 'every_1',
    'Every two (2)'     => 'every_2',
    'Every three (3)'   => 'every_3',
    'Every four (4)'    => 'every_4',
    'Every five (5)'    => 'every_5',
    'Every six (6)'     => 'every_6',
    'Every seven (7)'   => 'every_7',
    'Every eight (8)'   => 'every_8',
    'Every nine (9)'    => 'every_9',
    'Every ten (10)'    => 'every_10',
    'Every eleven (11)' => 'every_11',
    'Every twelve (12)' => 'every_12',
    'Before'            => 'before',
    'After'             => 'after',
    'Going to Bed'      => 'bed',
    'PRN'               => 'prn'
  }
  FREQUENCY_UNITS = %w[daily weekly monthly]
  FREQUENCY_UNITS_DAY = %w[day]
  FREQUENCY_UNITS_HOUR = %w[hour(s)]
  FREQUENCY_UNITS_MEALS = %w[breakfast lunch dinner snack]
  WINDOWS = %w[5 15 30 60] # minutes

  def self.units_from_freq(frequency)
    case frequency
      when /time/
        return FREQUENCY_UNITS
      when /other/
        return FREQUENCY_UNITS_DAY
      when /every/
        return FREQUENCY_UNITS_HOUR
      when /before|after/
        return FREQUENCY_UNITS_MEALS
      else
        return []
    end
  end

end
