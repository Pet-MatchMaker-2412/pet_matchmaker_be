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
    @photo_url = params[:photo_url]
    @age = params[:age]
    @gender = params[:gender]
    @size = params[:size]
    @species = params[:species]
    @city = params[:city]
    @state = params[:state]
    @description = params[:description]
    @email = params[:email]
  end
end
