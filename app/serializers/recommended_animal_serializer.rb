class RecommendedAnimalSerializer
  include JSONAPI::Serializer

  attributes :animal_type, :photo_url, :description
end
