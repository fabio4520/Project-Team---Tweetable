class Like < ApplicationRecord
  # validations
  validates :user, uniqueness: { scope: :tweet, message: "and Tweet combination already taken" }
  # associations
  belongs_to :user
  belongs_to :tweet, counter_cache: true
end
