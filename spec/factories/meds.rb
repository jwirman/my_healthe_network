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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :med do
    generic_name "Generic"
    brand_name "Brand"
    strength "10mg"
  end
end
