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
  # has_many :tweets, through: :likes
  has_many :likes

  # enum
  enum role: { member: 0,
               admin: 1}
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.username = auth.info.name
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
