class PetfinderAnimal
  attr_reader :id,
    :type,
    :name,
    :photo_url,
    :age,
    :gender,
    :size,
    :species,
    :city,
    :state,
    :description,
    :email

  def initialize(params, recommended_animal)
    @id = params[:id]
    @type = "petfinder_animal"
    @name = params[:name]
    @photo_url = if params[:primary_photo_cropped]
      params[:primary_photo_cropped][:full]
    else
      recommended_animal.photo_url
    end
    @age = params[:age]
    @gender = params[:gender]
    @size = params[:size]
    @species = params[:species]
    @city = params[:contact][:address][:city]
    @state = params[:contact][:address][:state]
    @description = params[:description] || recommended_animal.description
    @email = params[:contact][:email]
  end

  def self.get_animals(recommended_animal, zip_code)
    breed = recommended_animal.petf_breed
    type = recommended_animal.petf_type

    data = PetfinderGateway.petfinder_search(type, breed, zip_code)

    data[:animals].map do |animal|
      new(animal, recommended_animal)
    end
  end
end
