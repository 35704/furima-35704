class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, exclusion: {:in ["@"] }, presence: true
  validates :encrypted_password, length: { minimum: 6 }, with: /\A[a-z0-9]+\z/i, presence: true
  validates :first_name, wthh: /\A[ぁ-んァ-ヶ一-龥]/+\z, presence: true
  validates :last_name, with: /\A[ぁ-んァ-ヶ一-龥]/+\z, presence: true
  validates :first_name_kana, with: /\A[ァ-ヶー－]+\z/, presence: true
  validates :last_name_kana, with: /\A[ァ-ヶー－]+\z/, presence: true
  validates :birthday, presence:true
end
