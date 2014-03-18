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
  it { expect(Med).to have_constant(:FREQUENCY_UNITS_DAYS) }
  it { expect(Med).to have_constant(:FREQUENCY_UNITS_MEALS) }
  it { expect(Med).to have_constant(:WINDOWS) }

end
