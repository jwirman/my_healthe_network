class UsersMed < ActiveRecord::Base
  belongs_to :user
  belongs_to :med
end
