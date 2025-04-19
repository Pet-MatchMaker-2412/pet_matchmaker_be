class QuestionnaireSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :recommended_animal
  has_many :submission_answers
end
