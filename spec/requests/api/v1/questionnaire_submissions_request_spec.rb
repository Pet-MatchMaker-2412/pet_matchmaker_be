require "rails_helper"

RSpec.describe "Questionnaire Submissions API", type: :request do
  let(:user) { create(:user) }

  describe "Get Questionnaire Submissions Endpoint" do
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
          expect(submission[:id]).to be_a String
          expect(submission[:type]).to eq("questionnaire_submission")

          attributes = submission[:attributes]

          expect(attributes[:submission_answers][:data].count).to eq(3)
          attributes[:submission_answers][:data].each do |answer|
            expect(answer[:id]).to be_a String
            expect(answer[:type]).to eq("submission_answer")
            expect(answer[:attributes][:text]).to be_a String
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

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:not_found)
        expect(json[:message]).to eq("Couldn't find User with 'id'=-1")
        expect(json[:status]).to eq(404)
      end
    end
  end

  describe "Post Questionnaire Submissions Endpoint" do
    before do
      questions = create_list(:question, 10)
      questions.each do |q|
        create_list(:answer, 4, question: q)
      end
      create(:recommended_animal)
    end

    context "with valid request" do
      it "returns a list of the user's questionnaire submissions" do
        params = {
          answer_ids: Question.all.map do |q|
            q.answers.sample.id
          end
        }

        post api_v1_user_questionnaire_submissions_path(user.id), params: params, as: :json

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:data][:id]).to be_a String
        expect(json[:data][:type]).to eq("questionnaire_submission")

        attributes = json[:data][:attributes]

        expect(attributes[:submission_answers][:data].count).to eq(10)
        attributes[:submission_answers][:data].each do |answer|
          expect(answer[:id]).to be_a String
          expect(answer[:type]).to eq("submission_answer")
          expect(answer[:attributes][:text]).to be_a String
        end

        expect(attributes[:recommended_animal][:data][:type]).to eq("recommended_animal")
        expect(attributes[:recommended_animal][:data][:id]).to be_a String
        expect(attributes[:recommended_animal][:data][:attributes][:animal_type]).to be_a String
        expect(attributes[:recommended_animal][:data][:attributes][:photo_url]).to be_a String
      end
    end

    context "with invalid request" do
      it "returns an error for invalid user" do
        params = {
          answer_ids: Question.all.map do |q|
            q.answers.sample.id
          end
        }

        post api_v1_user_questionnaire_submissions_path(-1), params: params, as: :json

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:not_found)
        expect(json[:message]).to eq("Couldn't find User with 'id'=-1")
        expect(json[:status]).to eq(404)
      end

      it "returns an error for missing answer ids" do
        params = {answer_ids: []}

        post api_v1_user_questionnaire_submissions_path(user.id), params: params, as: :json

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("param is missing or the value is empty: answer_ids")
        expect(json[:status]).to eq(422)
      end

      it "returns an error for invalid answer ids" do
        params = {
          answer_ids: Question.all.map do |q|
            q.answers.sample.id
          end.drop(1)
        }

        post api_v1_user_questionnaire_submissions_path(user.id), params: params, as: :json

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:message]).to eq("Must have one answer for each question")
        expect(json[:status]).to eq(422)
      end
    end
  end
end
