class SubmissionAnswerSerializer
  include JSONAPI::Serializer

  attribute :text do |sub_answer|
    sub_answer.answer.text
  end
end
