require 'spec_helper'

describe User do

  it { should have_one :address }
  it { should have_many :users_meds }
  it { should have_many :meds }
  it { should have_many :scans }

  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

end
