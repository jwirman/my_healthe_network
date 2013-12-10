require 'spec_helper'

describe Scan do

  it { should belong_to :user }
  it { should belong_to :med }

  it { should validate_presence_of :med_id }

end
