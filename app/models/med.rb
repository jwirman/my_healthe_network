class Med < ActiveRecord::Base
  has_many :users, through: :users_meds

  validates :name, presence: true

end
