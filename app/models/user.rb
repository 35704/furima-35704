class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d\l]+\z/.freeze
  validates :nickname, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :birthday, presence:true
end
