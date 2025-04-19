class RecommendedAnimal < ApplicationRecord
  has_many :questionnaire_submissions
  has_many :recommended_animals_weights
end
