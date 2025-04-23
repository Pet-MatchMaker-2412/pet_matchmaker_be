class QuestionnaireSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :recommended_animal
  has_many :submission_answers

  def add_answers(answers)
    answers.each do |answer|
      submission_answers.new(answer: answer)
    end
  end
end
