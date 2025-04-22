require "rails_helper"

RSpec.describe "Questionnaire Submissions API", type: :request do
  describe "Get Questionnaire Submissions Endpoint" do
    let(:user) { create(:user) }

    context "with valid request" do
      before do
        submissions = create_list(:questionnaire_submission, 3, user: user)
        submissions.each do |submission|
          create_list(:submission_answer, 3, questionnaire_submission: submission)
        end
      end

      it "returns a list of the user's questionnaire submissions" do
        get api_v1_user_questionnaire_submissions_path(user.id)

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:data].count).to eq(3)
        json[:data].each do |submission|
          expect(submission).to have_key(:id)
          expect(submission).to have_key(:type)
          expect(submission[:type]).to eq("questionnaire_submission")

          attributes = submission[:attributes]

          expect(attributes[:submission_answers][:data].count).to eq(3)
          attributes[:submission_answers][:data].each do |answer|
            expect(answer[:id]).to be_a String
            expect(answer[:type]).to eq("submission_answer")
            expect(answer[:attributes][:answer_id]).to be_an Integer
          end

          expect(attributes[:recommended_animal][:data][:type]).to eq("recommended_animal")
          expect(attributes[:recommended_animal][:data][:id]).to be_a String
          expect(attributes[:recommended_animal][:data][:attributes][:animal_type]).to be_a String
          expect(attributes[:recommended_animal][:data][:attributes][:photo_url]).to be_a String
        end
      end
    end

    context "with invalid request" do
      it "returns an error for invalid user" do
        get api_v1_user_questionnaire_submissions_path(-1)

        expect(response).not_to be_successful
        expect(response.status).to eq(404)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:not_found)
        expect(json[:message]).to eq("Couldn't find User with 'id'=-1")
        expect(json[:status]).to eq(404)
      end
    end
  end
end
