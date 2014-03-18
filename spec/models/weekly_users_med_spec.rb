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

describe WeeklyUsersMed do

  it_behaves_like UsersMed

  it 'gets users_meds between two dates' do
    one = create(:weekly_users_med, start: 2.weeks.ago)
    two = create(:weekly_users_med, start: Date.today)
    expect(UsersMed.between(Date.yesterday, Date.tomorrow).to_a).to eq [two]
  end

  it 'adds to chart after create' do
    expect(Chart.count).to eq 0
    create(:weekly_users_med, num_doses: 15)
    expect(Chart.count).to eq 15
  end

  it 'gets one dose_time' do
    users_med = create(:weekly_users_med)
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  context 'datetimes for calendar' do
    let(:weekly_users_med) { create(:weekly_users_med, start: Date.today, window: 30,
                                         first_dose: Time.now.beginning_of_hour) }

    it 'gets first dose start/end datetime window' do
      dt = DateTime.now.beginning_of_hour.change(offset: "+0000")
      expect(weekly_users_med.dose_datetime).to eq dt
    end
  end

  context 'calculate days remaining' do
    before :each do
      @users_med = create(:weekly_users_med, start: Date.today, num_doses: 10)
    end

    it 'gets days remaining for once weekly med' do
      @users_med.freq = 'weekly'
      @users_med.freq_unit = ['1']
      expect(@users_med.days_remaining).to eq 70
    end

    it 'gets days remaining for twice weekly med' do
      @users_med.freq = 'weekly'
      @users_med.freq_unit = ['6', '0']
      expect(@users_med.days_remaining).to eq 35
    end
  end

end
