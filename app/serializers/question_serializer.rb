class QuestionSerializer
  include JSONAPI::Serializer

  attributes :text
  has_many :answers
end