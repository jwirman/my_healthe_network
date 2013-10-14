class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :address

  def to_s
    email
  end

end
