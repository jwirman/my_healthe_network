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

class Scan < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :med_id, presence: true

end
