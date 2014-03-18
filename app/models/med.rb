# == Schema Information
#
# Table name: meds
#
#  id           :integer          not null, primary key
#  generic_name :string(255)
#  brand_name   :string(255)
#  strength     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Med < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  has_many :users, through: :users_meds

  # validations ...............................................................
  validates :generic_name, presence: true

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  FREQUENCIES = {
    # display_value => stored_value
    'One time daily'    => 'daily_1',
    'Two times daily'   => 'daily_2',
    'Three times daily' => 'daily_3',
    'Four times daily'  => 'daily_4',
    'Five times daily'  => 'daily_5',
    'Six times daily'   => 'daily_6',
    'Every other day'   => 'daily_other',
    'Weekly'            => 'weekly',
    'Monthly'           => 'monthly',
    'Every hour'        => 'every_1',
    'Every 2 hours'     => 'every_2',
    'Every 3 hours'     => 'every_3',
    'Every 4 hours'     => 'every_4',
    'Every 5 hours'     => 'every_5',
    'Every 6 hours'     => 'every_6',
    'Every 7 hours'     => 'every_7',
    'Every 8 hours'     => 'every_8',
    'Every 9 hours'     => 'every_9',
    'Every 10 hours'    => 'every_10',
    'Every 11 hours'    => 'every_11',
    'Every 12 hours'    => 'every_12',
    'Before'            => 'before',
    'After'             => 'after',
    'Going to Bed'      => 'bed',
    'PRN'               => 'prn'
  }.with_indifferent_access.freeze
  FREQUENCY_UNITS_MEALS = %w[breakfast lunch dinner snack]
  FREQUENCY_UNITS_DAYS  = %w[Sun Mon Tues Wed Thur Fri Sat]
  WINDOWS               = %w[5 15 30 60] # minutes

  # class methods .............................................................
  # public instance methods ...................................................
  def to_s
    "#{generic_name} #{strength} (#{brand_name})"
  end

  # protected instance methods ................................................
  # private instance methods ..................................................

end
