class QuestionSerializer
  include JSONAPI::Serializer

  attributes :text
  
  attribute :answers do |question|
    question.answers.map do |answer|
      {
        id: answer.id.to_s,
        type: "answer",
        attributes: {
          text: answer.text
        }
      }
    end
  end
end