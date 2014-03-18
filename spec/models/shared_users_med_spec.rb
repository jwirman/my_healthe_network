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

require 'spec_helper'

shared_examples_for UsersMed do

  it { should belong_to :user }
  it { should belong_to :med }

  it { should validate_presence_of :med_id }
  it { should validate_presence_of :freq }
  it { should validate_presence_of :start }
  it { should validate_presence_of :num_doses }
  it { should validate_presence_of :window }
  it { should validate_numericality_of :num_per_dose }
  it { should validate_numericality_of :num_doses }
  it { should ensure_inclusion_of(:freq).in_array Med::FREQUENCIES.values }
  it { should ensure_inclusion_of(:window).in_array Med::WINDOWS.map{|str| str.to_i} }

end
