class SubmissionAnswer < ApplicationRecord
  belongs_to :questionnaire_submission
  belongs_to :answer
end
