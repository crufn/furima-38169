class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :family_kata, presence: true, format: { with: KATAKANA_REGEXP }
  validates :first_name, presence: true
  validates :first_kata, presence: true, format: { with: KATAKANA_REGEXP }
  validates :email, presence: true
  validates :birthday, presence: true


end
