class RecommendedAnimalSerializer
  include JSONAPI::Serializer

  set_type :recommended_animal
  attributes :animal_type ##, :photo_url
end