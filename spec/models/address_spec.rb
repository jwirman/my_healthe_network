# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  line1      :string(255)
#  line2      :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Address do

  it { should belong_to :user }

end
