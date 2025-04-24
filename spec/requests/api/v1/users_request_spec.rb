require "rails_helper"

RSpec.describe "Users API", type: :request do
  describe "Create User Endpoint" do
    let(:user_params) do
      {
        username: Faker::Internet.unique.username
      }
    end

    context "with valid request" do
      it "returns 201 Created and provides expected fields" do
        post api_v1_users_path, params: user_params, as: :json

        expect(response).to have_http_status(:created)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data][:type]).to eq("user")
        expect(json[:data][:id]).to eq(User.last.id.to_s)
        expect(json[:data][:attributes][:username]).to eq(user_params[:username])
      end
    end

    context "with invalid request" do
      it "returns an error for non-unique username" do
        duplicated_name = Faker::Internet.unique.username
        user_params[:username] = duplicated_name
        User.create!(username: duplicated_name)

        post api_v1_users_path, params: user_params, as: :json
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Username has already been taken")
        expect(json[:status]).to eq(422)
      end

      it "returns an error for missing username" do
        user_params[:username] = ""

        post api_v1_users_path, params: user_params, as: :json
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("param is missing or the value is empty: username")
        expect(json[:status]).to eq(422)
      end
    end
  end

  describe "GET User Endpoint" do
    let(:user) { create(:user) }
    let(:params) { {username: user.username} }

    context "with valid request" do
      it "returns 200 OK and provides expected fields" do
        get api_v1_users_path, params: params

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data][:type]).to eq("user")
        expect(json[:data][:id]).to eq(user.id.to_s)
        expect(json[:data][:attributes][:username]).to eq(user.username)
      end
    end

    context "with invalid request" do
      it "returns an error for missing username" do
        params[:username] = nil

        get api_v1_users_path, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:message]).to eq("param is missing or the value is empty: username")
        expect(json[:status]).to eq(422)
      end

      it "returns 404 Not Found" do
        params[:username] = "joe_biden"

        get api_v1_users_path, params: params

        expect(response).to have_http_status(:not_found)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:message]).to eq("User not found")
        expect(json[:status]).to eq(404)
      end
    end

    it "returns an error for empty username" do
      params[:username] = ""

      get api_v1_users_path, params: params

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to eq("param is missing or the value is empty: username")
      expect(json[:status]).to eq(422)
    end
  end
end
