class Tweet < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :replied_to,  class_name: "Tweet", optional: true, counter_cache: true
  has_many :likes, dependent: :nullify
  has_many :users, through: :likes

  # Validations
  validates :body, presence: true, length: { maximum: 140 }
end
