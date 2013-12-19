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

describe UsersMed do

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
  it { should ensure_inclusion_of(:freq_unit).in_array Med::FREQUENCY_UNITS +
                                                       Med::FREQUENCY_UNITS_DAY +
                                                       Med::FREQUENCY_UNITS_HOUR +
                                                       Med::FREQUENCY_UNITS_MEALS }
  it { should ensure_inclusion_of(:window).in_array Med::WINDOWS.map{|str| str.to_i} }

  it 'validates correct frequency units for given frequency' do
    users_med = UsersMed.new(attributes_for(:users_med, freq: 'time_1', freq_unit: 'lunch'))
    expect(users_med).to have(1).error_on(:freq_unit)
    expect(users_med.errors_on(:freq_unit)).to include('is not valid')
  end

  it 'gets one dose_time' do
    users_med = create(:users_med, freq: 'time_1', freq_unit: 'daily')
    expect(users_med.dose_times).to match_array([users_med.first_dose])
  end

  it 'gets two dose_times' do
    users_med = create(:users_med, freq: 'time_2', freq_unit: 'daily')
    expect(users_med.dose_times).to match_array([users_med.first_dose, users_med.second_dose])
  end

  it 'gets six dose_times' do
    users_med = create(:users_med, freq: 'time_6', freq_unit: 'daily')
    expect(users_med.dose_times).to match_array([users_med.first_dose,
                                                 users_med.second_dose,
                                                 users_med.third_dose,
                                                 users_med.fourth_dose,
                                                 users_med.fifth_dose,
                                                 users_med.sixth_dose])
  end

  context 'calculate days remaining' do
    before :each do
      @users_med = create(:users_med, start: Date.today, num_doses: 10)
    end

    it 'gets days remaining for once daily med' do
      @users_med.freq = 'time_1'
      @users_med.freq_unit = 'daily'
      expect(@users_med.days_remaining).to eq 10
    end

    it 'gets days remaining for once daily med starting 2 weeks from now' do
      @users_med.freq = 'time_1'
      @users_med.freq_unit = 'daily'
      @users_med.start = 2.weeks.from_now
      expect(@users_med.days_remaining).to eq 24
    end

    it 'gets days remaining for once daily med starting 1 week ago' do
      @users_med.freq = 'time_1'
      @users_med.freq_unit = 'daily'
      @users_med.start = 1.weeks.ago
      expect(@users_med.days_remaining).to eq 3
    end

    it 'gets days remaining for twice daily med' do
      @users_med.freq = 'time_2'
      @users_med.freq_unit = 'daily'
      expect(@users_med.days_remaining).to eq 5
    end

    it 'gets days remaining for once weekly med' do
      @users_med.freq = 'time_1'
      @users_med.freq_unit = 'weekly'
      expect(@users_med.days_remaining).to eq 70
    end

    it 'gets days remaining for twice weekly med' do
      @users_med.freq = 'time_2'
      @users_med.freq_unit = 'weekly'
      expect(@users_med.days_remaining).to eq 35
    end

    it 'gets days remaining for once monthly med' do
      @users_med.freq = 'time_1'
      @users_med.freq_unit = 'monthly'
      expect(@users_med.days_remaining).to eq 300
    end

    it 'gets days remaining for twice monthly med' do
      @users_med.freq = 'time_2'
      @users_med.freq_unit = 'monthly'
      expect(@users_med.days_remaining).to eq 150
    end

    it 'gets days remaining for every other day med' do
      @users_med.freq = 'other'
      @users_med.freq_unit = 'day'
      expect(@users_med.days_remaining).to eq 20
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

    it 'gets days remaining for before dinner med' do
      @users_med.freq = 'before'
      @users_med.freq_unit = 'dinner'
      expect(@users_med.days_remaining).to eq 10
    end
  end

end
