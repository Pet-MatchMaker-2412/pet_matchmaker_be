class PetfinderAnimalSerializer
  include JSONAPI::Serializer
  attributes :name,
    :photo_url,
    :age,
    :gender,
    :size,
    :species,
    :city,
    :state,
    :description,
    :email
end
