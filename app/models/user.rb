class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Not dependent on destroy because the pharmacy or laboratory can continue to exist without an user. It can be claimed.
  has_many :laboratories
  has_many :pharmacies

  
end
