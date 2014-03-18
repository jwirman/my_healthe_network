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
require 'models/shared_users_med_spec'

describe UsersMed do

  it_behaves_like UsersMed

  it 'gets users_meds between two dates' do
    one = create(:users_med, start: 2.weeks.ago)
    two = create(:users_med, start: Date.today)
    expect(UsersMed.between(Date.yesterday, Date.tomorrow).to_a).to eq [two]
  end

  it 'adds to chart after create' do
    expect(Chart.count).to eq 0
    create(:users_med, num_doses: 5)
    expect(Chart.count).to eq 5
  end

  it 'updates chart after update' do
    users_med = create(:users_med, num_doses: 5)
    expect(Chart.count).to eq 5
    users_med.update_attribute(:num_doses, 10)
    expect(Chart.count).to eq 10
  end

  it 'removes from chart after destroy' do
    users_med = create(:users_med, num_doses: 5)
    expect(Chart.count).to eq 5
    users_med.destroy
    expect(Chart.count).to eq 0
  end

  it 'gets one dose_time' do
    users_med = create(:users_med)
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  it 'gets first dose datetime' do
    users_med = create(:users_med, start: Date.today,
                                   window: 30,
                                   first_dose: Time.now.beginning_of_hour)
    dt = DateTime.now.beginning_of_hour.change(offset: "+0000")
    expect(users_med.dose_datetime).to eq dt
  end

  it 'gets days remaining for before dinner med' do
    @users_med = create(:users_med, start: Date.today, num_doses: 10)
    expect(@users_med.days_remaining).to eq 10
  end

end
