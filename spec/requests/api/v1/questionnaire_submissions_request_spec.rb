require "rails_helper"

RSpec.describe "GET /api/v1/users/:user_id/questionnaire_submissions", type: :request do
  let(:user) { create(:user) }

  describe "Happy Path" do
    context "when the user has questionnaire submissions" do
      before do
        @submissions = create_list(:questionnaire_submission, 3, user: user)
      end

      it "returns a list of the user's questionnaire submissions" do
        get api_v1_user_questionnaire_submissions_path(user.id)
require 'pry'; binding.pry
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
    end
  end
end