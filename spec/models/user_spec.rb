# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  first_name             :string(255)
#  last_name              :string(255)
#  is_admin               :boolean          default(FALSE), not null
#  dob                    :string(255)
#  cell_phone             :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

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
