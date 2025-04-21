require "rails_helper"

RSpec.describe "GET /api/v1/users/:user_id/questionnaire_submissions", type: :request do
  let(:user) { create(:user) }

  describe "Happy Path" do
    context "when the user has questionnaire submissions" do
      before do
        @submissions = create_list(:questionnaire_submission, 3, user: user, submission_answers: create_list(:submission_answer, 3))
      end

      it "returns a list of the user's questionnaire submissions" do
        get api_v1_user_questionnaire_submissions_path(user.id)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        questionnaire_submissions = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(questionnaire_submissions).to be_an(Array)
        expect(questionnaire_submissions.count).to eq(3)

        questionnaire_submissions.each do |submission|
          expect(submission).to have_key(:id)
          expect(submission).to have_key(:type)
          expect(submission[:type]).to eq("questionnaire_submissions")
          expect(submission[:attributes]).to have_key(:recommended_animal_id)
          expect(submission[:attributes][:user_id]).to eq(user.id)
        end
      end
    end
  end
end