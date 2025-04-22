class RecommendedAnimal < ApplicationRecord
  has_many :questionnaire_submissions
  has_many :recommended_animals_weights

  validates :petf_type, presence: true
  validates :photo_url, presence: true
end
