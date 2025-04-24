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
        expect(json[:message]).to eq("Username can't be blank")
        expect(json[:status]).to eq(422)
      end
    end
  end

  describe "GET /api/v1/users" do
    let!(:user) { create(:user, username: "test_user") }
    let(:valid_json) { { "username" => "test_user" }.to_json }
    let(:missing_username_json) { { "username" => "" }.to_json }
    let(:invalid_json) { "not_valid_json" }
    let(:nonexistent_json) { { "username" => "ghost_user" }.to_json }
    let(:headers) { { "CONTENT_TYPE" => "application/json" } }

    context "when valid username is provided" do
      it "returns the user and 200 OK" do
        stub_request_body(valid_json)

        get api_v1_users_path, headers: headers

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data][:attributes][:username]).to eq("test_user")
      end
    end

    context "when username is missing" do
      it "returns 422 Unprocessable Entity" do
        stub_request_body(missing_username_json)

        get api_v1_users_path, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:message]).to eq("Username is required")
        expect(json[:status]).to eq(422)
      end
    end

    context "when user is not found" do
      it "returns 404 Not Found" do
        stub_request_body(nonexistent_json)

        get api_v1_users_path, headers: headers

        expect(response).to have_http_status(:not_found)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:message]).to eq("User not found")
        expect(json[:status]).to eq(404)
      end
    end

    context "when invalid JSON is provided" do
      it "returns 422 Unprocessable Entity" do
        stub_request_body(invalid_json)

        get api_v1_users_path, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:message]).to eq("Username is required")
        expect(json[:status]).to eq(422)
      end
    end
  end

  
  private
  def stub_request_body(json_string)
    # This mocks the raw JSON body of a GET request
    # Rails does not provide request.body for GET requests with params,
    # so I'm manually stubbing it to simulate the frontend sending JSON in the request body.
    allow_any_instance_of(ActionDispatch::Request).to receive(:body).and_return(StringIO.new(json_string))
  end
end



