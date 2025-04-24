class SubmissionAnswer < ApplicationRecord
  belongs_to :questionnaire_submission
  belongs_to :answer
  has_many :recommended_animals_weights, through: :answer
end
