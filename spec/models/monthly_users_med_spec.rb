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

describe MonthlyUsersMed do

  it_behaves_like UsersMed

  it 'gets users_meds between two dates' do
    one = create(:monthly_users_med, start: 2.weeks.ago)
    two = create(:monthly_users_med, start: Date.today)
    expect(UsersMed.between(Date.yesterday, Date.tomorrow).to_a).to eq [two]
  end

  it 'adds to chart after create' do
    expect(Chart.count).to eq 0
    create(:monthly_users_med, num_doses: 5)
    expect(Chart.count).to eq 5
  end

  it 'gets one dose_time' do
    users_med = create(:monthly_users_med)
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  context 'datetimes for calendar' do
    let(:monthly_users_med) { create(:monthly_users_med, start: Date.today, window: 30,
                                         first_dose: Time.now.beginning_of_hour) }

    it 'gets first dose start/end datetime window' do
      dt = DateTime.now.beginning_of_hour.change(offset: "+0000")
      expect(monthly_users_med.dose_datetime).to eq dt
    end
  end

  context 'calculate days remaining' do
    before :each do
      @users_med = create(:monthly_users_med, start: '2014-01-01', num_doses: 2)
    end

    it 'gets days remaining for once monthly med' do
      @users_med.freq_unit = ['1']
      expect(@users_med.days_remaining(@users_med.start)).to eq 31
    end

    it 'gets days remaining for twice monthly med' do
      @users_med.freq_unit = ['1','2']
      expect(@users_med.days_remaining(@users_med.start)).to eq 1
    end
  end

end
