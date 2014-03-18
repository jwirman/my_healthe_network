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

describe HourlyUsersMed do

  it_behaves_like UsersMed

  it 'gets users_meds between two dates' do
    one = create(:users_med, start: 2.weeks.ago)
    two = create(:users_med, start: Date.today)
    expect(UsersMed.between(Date.yesterday, Date.tomorrow).to_a).to eq [two]
  end

  it 'adds to chart after create' do
    expect(Chart.count).to eq 0
    create(:hourly_users_med, freq: 'every_8', num_doses: 29)
    expect(Chart.count).to eq 30
  end

  it 'gets one dose_time' do
    users_med = create(:hourly_users_med)
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  context 'datetimes for calendar' do
    let(:hourly_users_med) { create(:hourly_users_med, start: Date.today, window: 30,
                                         first_dose: Time.now.beginning_of_hour,
                                         second_dose: Time.now.end_of_hour) }

    it 'gets first dose start/end datetime window' do
      dt = DateTime.now.beginning_of_hour.change(offset: "+0000")
      expect(hourly_users_med.dose_datetime).to eq dt
    end
  end

  context 'calculate days remaining' do
    before :each do
      @users_med = create(:hourly_users_med, start: Date.today, num_doses: 10)
    end

    it 'gets days remaining for every hour med' do
      @users_med.freq = 'every_1'
      @users_med.freq_unit = 'hours'
      @users_med.num_doses = 48
      expect(@users_med.days_remaining).to eq 2
    end

    it 'gets days remaining for every four hours med' do
      @users_med.freq = 'every_4'
      @users_med.freq_unit = 'hours'
      @users_med.num_doses = 48
      expect(@users_med.days_remaining).to eq 8
    end

    it 'gets days remaining for every twelve hours med' do
      @users_med.freq = 'every_12'
      @users_med.freq_unit = 'hours'
      @users_med.num_doses = 48
      expect(@users_med.days_remaining).to eq 24
    end
  end

end
