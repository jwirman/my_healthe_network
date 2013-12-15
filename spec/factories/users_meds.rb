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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :users_med do
    user_id 1
    med_id 1
    freq "time_1"
    freq_unit "daily"
    start "2013-12-08"
    first_dose  Time.now
    second_dose Time.now + 1.hour
    third_dose  Time.now + 2.hours
    fourth_dose Time.now + 3.hours
    fifth_dose  Time.now + 4.hours
    sixth_dose  Time.now + 5.hours
    window 5
    num_doses 1
  end
end
