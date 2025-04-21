class QuestionnaireSubmissionsSerializer
  include JSONAPI::Serializer
  attributes :user_id, :recommended_animal_id

  has_many :submission_answers
  belongs_to :recommended_animal
end
