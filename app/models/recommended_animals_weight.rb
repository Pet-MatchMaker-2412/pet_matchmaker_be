class RecommendedAnimalsWeight < ApplicationRecord
  belongs_to :recommended_animal
  belongs_to :answer

  validates :weight, presence: true, numericality: {in: 0..1}
end
