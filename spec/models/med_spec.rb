# == Schema Information
#
# Table name: meds
#
#  id           :integer          not null, primary key
#  generic_name :string(255)
#  brand_name   :string(255)
#  strength     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Med do

  it { should have_many :users }
  it { should validate_presence_of :generic_name }

  it { expect(Med).to have_constant(:FREQUENCIES) }
  it { expect(Med).to have_constant(:FREQUENCY_UNITS) }
  it { expect(Med).to have_constant(:FREQUENCY_UNITS_DAY) }
  it { expect(Med).to have_constant(:FREQUENCY_UNITS_HOUR) }
  it { expect(Med).to have_constant(:FREQUENCY_UNITS_MEALS) }
  it { expect(Med).to have_constant(:WINDOWS) }

  it 'gets units based on time frequency' do
    freq = Med::FREQUENCIES.fetch('One time')
    expect(Med.units_from_freq(freq)).to eq Med::FREQUENCY_UNITS
  end

  it 'gets units based on other frequency' do
    freq = Med::FREQUENCIES.fetch('Every other')
    expect(Med.units_from_freq(freq)).to eq Med::FREQUENCY_UNITS_DAY
  end

  it 'gets units based on every frequency' do
    freq = Med::FREQUENCIES.fetch('Every two (2)')
    expect(Med.units_from_freq(freq)).to eq Med::FREQUENCY_UNITS_HOUR
  end

  it 'gets units based on before/after frequency' do
    freq = Med::FREQUENCIES.fetch('Before')
    expect(Med.units_from_freq(freq)).to eq Med::FREQUENCY_UNITS_MEALS
  end

  it 'gets units based on bed/prn frequency' do
    freq = Med::FREQUENCIES.fetch('PRN')
    expect(Med.units_from_freq(freq)).to eq ['']
  end

end
