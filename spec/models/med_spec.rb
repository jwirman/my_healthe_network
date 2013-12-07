require 'spec_helper'

describe Med do

  it { should have_many :users }
  it { should validate_presence_of :generic_name }

end
