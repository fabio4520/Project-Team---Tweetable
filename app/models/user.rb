class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # validations
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  has_one_attached :avatar
  # Associations
  has_many :tweets, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :tweets, through: :likes

  # enum
  enum role: { member: 0,
               admin: 1}

end
