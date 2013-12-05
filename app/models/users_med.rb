class UsersMed < ActiveRecord::Base
  belongs_to :user
  belongs_to :med

  validates :med_id, :freq, :start, presence: true, allow_blank: false
  validates :num_per_dose, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
  validates :num_doses,    numericality: { greater_than: 0, only_integer: true }, presence: true

end
