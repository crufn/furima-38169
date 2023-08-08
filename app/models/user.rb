class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :purchase_records

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/ }
  validates :family_kata, presence: true, format: { with: KATAKANA_REGEXP }
  validates :first_name, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/ }
  validates :first_kata, presence: true, format: { with: KATAKANA_REGEXP }
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items

end
