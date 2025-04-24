class QuestionnaireSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :recommended_animal
  has_many :submission_answers

  def add_answers(answer_ids)
    answer_ids.each do |answer_id|
      submission_answers.new(answer_id: answer_id)
    end
  end
end
