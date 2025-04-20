class Api::V1::PetfinderAnimalsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render json: ErrorSerializer.format_error(ErrorMessage.new("Invalid Recommended Animal ID", 422)), status: :unprocessable_entity
  end
  def index
    if animal_params[:recommended_animal_id].nil?
      render json: ErrorSerializer.format_error(ErrorMessage.new("Recommended Animal ID must be provided", 422)), status: :unprocessable_entity
      return
    end

    if animal_params[:zipcode].nil?
      render json: ErrorSerializer.format_error(ErrorMessage.new("Zipcode must be provided", 422)), status: :unprocessable_entity
      return
    end

    if !ValidatesZipcode.valid?(animal_params[:zipcode], "US")
      render json: ErrorSerializer.format_error(ErrorMessage.new("Invalid zipcode", 422)), status: :unprocessable_entity
      return
    end

    RecommendedAnimal.find(animal_params[:recommended_animal_id])

    render json: PetfinderAnimalSerializer.new
  end

  private

  def animal_params
    params.permit(:recommended_animal_id, :zipcode)
  end
end
