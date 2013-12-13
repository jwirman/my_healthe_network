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

  it 'determines number of doses from frequency and frequency_unit'


end
