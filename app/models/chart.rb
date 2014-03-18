class Chart < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :user_id, :med_id, :taken_at, presence: true

end
