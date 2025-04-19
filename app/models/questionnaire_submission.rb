class QuestionnaireSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :recommended_animal
end
