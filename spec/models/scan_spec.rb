# == Schema Information
#
# Table name: scans
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  med_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Scan do

  it { should belong_to :user }
  it { should belong_to :med }

  it { should validate_presence_of :med_id }

end
