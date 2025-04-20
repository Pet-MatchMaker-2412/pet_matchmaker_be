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

  def initialize(params)
    @id = params[:id]
    @type = "petfinder_animal"
    @name = params[:name]
    @photo_url = if params[:primary_photo_cropped]
      params[:primary_photo_cropped][:full]
    else
      ""
    end
    @age = params[:age]
    @gender = params[:gender]
    @size = params[:size]
    @species = params[:species]
    @city = params[:contact][:address][:city]
    @state = params[:contact][:address][:state]
    @description = params[:description]
    @email = params[:contact][:email]
  end

  def self.mock
    data = JSON.parse(File.read("spec/fixtures/petfinder_animals.json"), symbolize_names: true)
    data[:animals].map do |animal|
      new(animal)
    end
  end
end
