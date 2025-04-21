require "rails_helper"

RSpec.describe "GET /api/v1/users/:user_id/questionnaire_submissions", type: :request do
  describe "Happy Path" do
    context "can return users questionnaire submissions" do
      post api_v1_users_questionnaire_submissions_path
    end
  end
end