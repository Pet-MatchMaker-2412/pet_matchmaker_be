class SubmissionAnswerSerializer
  include JSONAPI::Serializer

  set_type :submission_answer
  attributes :answer_id
end