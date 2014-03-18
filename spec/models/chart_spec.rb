require 'spec_helper'

describe Chart do

  it { should belong_to :user }
  it { should belong_to :med }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :med_id }
  it { should validate_presence_of :taken_at }

end
