require 'spec_helper'

describe UsersMed do

  it { should belong_to :user }
  it { should belong_to :med }

  it { should validate_presence_of :med_id }
  it { should validate_presence_of :freq }
  it { should validate_presence_of :start }
  it { should validate_presence_of :num_doses }
  it { should validate_numericality_of :num_per_dose }
  it { should validate_numericality_of :num_doses }

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

end
