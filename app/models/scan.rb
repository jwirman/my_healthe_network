class Scan < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :med_id, presence: true

end
