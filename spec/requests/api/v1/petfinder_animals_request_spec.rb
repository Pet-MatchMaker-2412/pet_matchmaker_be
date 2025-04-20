require "rails_helper"

RSpec.describe "Petfinder Animals API", type: :request do
  describe "Get Petfinder Animals Endpoint" do
    before do
      create(:recommended_animal)
    end

    let(:animal_params) do
      {
        recommended_animal_id: 1,
        zipcode: "07097"
      }
    end

    context "with valid request" do
      it "returns 200 and provides expected fields" do
        get api_v1_petfinder_animals_path, params: animal_params

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data]).to be_an Array
        expect(json[:data].length).to be > 0
        json[:data].each do |animal|
          expect(animal[:type]).to eq("petfinder_animal")
          expect(animal[:id]).to be_a String
          attrs = animal[:attributes]
          expect(attrs[:name]).to be_a String
          expect(attrs[:photo_url]).to be_a String
          expect(attrs[:age]).to be_a String
          expect(attrs[:gender]).to be_a String
          expect(attrs[:size]).to be_a String
          expect(attrs[:species]).to be_a String
          expect(attrs[:city]).to be_a String
          expect(attrs[:state]).to be_a String
          expect(attrs[:description]).to be_a String
          expect(attrs[:email]).to be_a String
        end
      end
    end

    context "with invalid request" do
      it "returns 422 for missing recommended_animal_id" do
        animal_params[:recommended_animal_id] = nil

        get api_v1_petfinder_animals_path, params: animal_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Recommended Animal ID must be provided")
        expect(json[:status]).to eq(422)
      end

      it "returns 422 for missing zipcode" do
        animal_params[:zipcode] = nil

        get api_v1_petfinder_animals_path, params: animal_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Zipcode must be provided")
        expect(json[:status]).to eq(422)
      end

      it "returns 422 for invalid zipcode" do
        animal_params[:zipcode] = "34"

        get api_v1_petfinder_animals_path, params: animal_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Invalid zipcode")
        expect(json[:status]).to eq(422)
      end

      it "returns 422 for invalid recommended animal id" do
        animal_params[:recommended_animal_id] = 1_000_000

        get api_v1_petfinder_animals_path, params: animal_params

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Invalid Recommended Animal ID")
        expect(json[:status]).to eq(422)
      end
    end
  end
end
