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

end
