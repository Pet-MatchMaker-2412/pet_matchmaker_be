require "rails_helper"

RSpec.describe "GET /api/v1/users/:user_id/questionnaire_submissions", type: :request do
  let(:user) { create(:user) }
  require 'pry'; binding.pry
  describe "Happy Path" do
    context "when the user has questionnaire submissions" do
      before do 
        create_list(:questionnaire_submission, 3, user: user)
      end

      it "returns a list of the users questionnaire submissions" do
        get api_v1_users_questionnaire_submissions_path(user.id)
      end
    end
  end
end