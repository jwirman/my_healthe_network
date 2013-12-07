# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :med do
    generic_name "Generic"
    brand_name "Brand"
    strength "10mg"
  end
end
