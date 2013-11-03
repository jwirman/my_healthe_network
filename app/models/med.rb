class Med < ActiveRecord::Base
  has_many :users, through: :users_meds

  validates :generic_name, presence: true

end
