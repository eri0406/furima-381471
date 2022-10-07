class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :encrypted_password, presence:true
  with_options presence: true do
  validates :last_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "is invalid. Input full-width characteres."}
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "is invalid. Input full-width characteres."}
  validates :read_last_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :read_first_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end
end
