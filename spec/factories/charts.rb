# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
    user
    med
    taken_at "2014-01-26 18:12:09"
  end
end
