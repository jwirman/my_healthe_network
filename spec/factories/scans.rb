# == Schema Information
#
# Table name: scans
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  med_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scan do
    user
    med
  end
end
