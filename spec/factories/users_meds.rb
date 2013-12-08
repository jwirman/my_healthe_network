# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :users_med do
    med_id 1
    freq "One time"
    freq_unit "Daily"
    start "2013-12-08"
    window 1
    num_doses 1
  end
end
