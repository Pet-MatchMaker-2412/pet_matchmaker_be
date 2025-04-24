class RecommendedAnimal < ApplicationRecord
  has_many :questionnaire_submissions
  has_many :recommended_animals_weights

  validates :petf_type, presence: true
  validates :photo_url, presence: true

  def self.calculate_animal(submission_answers)
    submission_answers_weights = submission_answers.map do |sub_answer|
      sub_answer.recommended_animals_weights
    end

    RecommendedAnimal.all.max_by do |animal|
      animal.recommended_animals_weights.sum do |db_weight|
        if submission_answers_weights.any? { |weight_array| weight_array.include?(db_weight) }
          db_weight.weight
        else
          0
        end
      end
    end
  end
end
