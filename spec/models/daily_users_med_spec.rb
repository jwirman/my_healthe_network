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

describe DailyUsersMed do

  it_behaves_like UsersMed

  context 'validates second_dose' do
    subject { DailyUsersMed.new(attributes_for(:daily_users_med, freq: 'daily_2')) }
    it { should validate_presence_of :second_dose }
  end
  context 'validates third_dose' do
    subject { DailyUsersMed.new(attributes_for(:daily_users_med, freq: 'daily_3')) }
    it { should validate_presence_of :third_dose }
  end
  context 'validates fourth_dose' do
    subject { DailyUsersMed.new(attributes_for(:daily_users_med, freq: 'daily_4')) }
    it { should validate_presence_of :fourth_dose }
  end
  context 'validates fifth_dose' do
    subject { DailyUsersMed.new(attributes_for(:daily_users_med, freq: 'daily_5')) }
    it { should validate_presence_of :fifth_dose }
  end
  context 'validates sixth_dose' do
    subject { DailyUsersMed.new(attributes_for(:daily_users_med, freq: 'daily_6')) }
    it { should validate_presence_of :sixth_dose }
  end

  it 'adds to chart after create' do
    expect(Chart.count).to eq 0
    create(:daily_users_med, freq: 'daily_6', num_doses: 6)
    expect(Chart.count).to eq 6
  end

  it 'adds to chart for every_other_day med after create' do
    expect(Chart.count).to eq 0
    create(:daily_users_med, freq: 'daily_other', num_doses: 4)
    expect(Chart.count).to eq 4
  end

  it 'updates chart after update' do
    users_med = create(:daily_users_med, freq: 'daily_1', num_doses: 6)
    expect(Chart.count).to eq 6
    users_med.update_attribute(:num_doses, 10)
    expect(Chart.count).to eq 10
  end

  it 'removes from chart after destroy' do
    users_med = create(:daily_users_med, freq: 'daily_1', num_doses: 5)
    expect(Chart.count).to eq 5
    users_med.destroy
    expect(Chart.count).to eq 0
  end

  it 'gets one dose_time' do
    users_med = create(:daily_users_med, freq: 'daily_1')
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  it 'gets two dose_times' do
    users_med = create(:daily_users_med, freq: 'daily_2')
    expect(users_med.dose_times).to match_array([users_med.first_dose, users_med.second_dose])
  end

  it 'gets three dose_times' do
    users_med = create(:daily_users_med, freq: 'daily_3')
    expect(users_med.dose_times).to match_array([users_med.first_dose, users_med.second_dose, users_med.third_dose])
  end

  it 'gets five dose_times' do
    users_med = create(:daily_users_med, freq: 'daily_5')
    expect(users_med.dose_times).to match_array([users_med.first_dose,
                                                 users_med.second_dose,
                                                 users_med.third_dose,
                                                 users_med.fourth_dose,
                                                 users_med.fifth_dose])
  end

  it 'gets six dose_times' do
    users_med = create(:daily_users_med, freq: 'daily_6')
    expect(users_med.dose_times).to match_array([users_med.first_dose,
                                                 users_med.second_dose,
                                                 users_med.third_dose,
                                                 users_med.fourth_dose,
                                                 users_med.fifth_dose,
                                                 users_med.sixth_dose])
  end

  context 'datetimes for calendar' do
    let(:daily_users_med) { create(:daily_users_med, start: Date.today, window: 30,
                                         first_dose: Time.now.beginning_of_hour,
                                         second_dose: Time.now.end_of_hour) }

    it 'gets first dose start/end datetime window' do
      dt = DateTime.now.beginning_of_hour.change(offset: "+0000")
      expect(daily_users_med.dose_datetime).to eq dt
    end

    it 'gets second dose start/end datetime window' do
      dt = DateTime.now.end_of_hour.change(offset: "+0000")
      expect(daily_users_med.dose_datetime(Date.today, 2)).to eq dt
    end
  end

  context 'calculate days remaining' do
    before :each do
      @users_med = create(:daily_users_med, start: Date.today, num_doses: 10)
    end

    it 'gets days remaining for once daily med' do
      @users_med.freq = 'daily_1'
      expect(@users_med.days_remaining).to eq 10
    end

    it 'gets days remaining for once daily med starting 2 weeks from now' do
      @users_med.freq = 'daily_1'
      @users_med.start = 2.weeks.from_now
      expect(@users_med.days_remaining).to eq 24
    end

    it 'gets days remaining for once daily med starting 1 week ago' do
      @users_med.freq = 'daily_1'
      @users_med.start = 1.weeks.ago
      expect(@users_med.days_remaining).to eq 3
    end

    it 'gets days remaining for twice daily med' do
      @users_med.freq = 'daily_2'
      expect(@users_med.days_remaining).to eq 5
    end
  end

end
