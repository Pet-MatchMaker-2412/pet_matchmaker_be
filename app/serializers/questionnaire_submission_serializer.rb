class QuestionnaireSubmissionSerializer
  include JSONAPI::Serializer
  attributes :user_id
  attributes :saved

  attribute :submission_answers do |submission|
    SubmissionAnswerSerializer.new(submission.submission_answers)
  end

  attribute :recommended_animal do |submission|
    RecommendedAnimalSerializer.new(submission.recommended_animal)
  end
end
