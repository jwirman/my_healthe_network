class Med < ActiveRecord::Base
  has_many :users, through: :users_meds

  validates :generic_name, presence: true

  def to_s
    "#{generic_name} #{strength} (#{brand_name})"
  end


#  Once
#  Twice
#  Three times
#  Four times
#  Five times
#  Six times
#
#  Every other
#
#  Every one  (1)
#  Every two (2)
#  Every three (3)
#  Every four (4)
#  Every five (5)
#  Every six (6)
#  Every seven (7)
#  Every eight (8)
#  Every nine (9)
#  Every ten (10)
#  Every eleven (11)
#  Every twelve (12)
#
#  Before
#  After
#
#
#  At Bedtime
#
#  PRN





# Daily
# Weekly
# Monthly
#
#
#
#
# Day
#
# Hour
# Hours
#
#
#
#
#
#
#
#
#
#
#
# Breakfast
# Lunch
# Dinner
# Snack

end
