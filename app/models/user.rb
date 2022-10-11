class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :encrypted_password, presence:true
  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :read_last_name, presence:true
  validates :read_first_name, presence:true
end
