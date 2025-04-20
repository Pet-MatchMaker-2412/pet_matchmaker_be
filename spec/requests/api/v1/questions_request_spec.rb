require "rails_helper" 

RSpec.describe "Questions API", type: :request do
  describe "Get Questions Endpoint" do 
    before(:each) do 
      @question1 = create(:question)
      create_list(:answer, 3, question: @question1)
      @question2 = create(:question)
      create_list(:answer, 3, question: @question2)
    end

    context "with valid request" do
      it "returns all questions with their related answers" do 
        get "/api/v1/questions"

        expect(response).to be_successful 
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data].count).to eq(2)

        json[:data].each do |question|
          expect(question).to have_key(:id)
          expect(question[:type]).to eq("question")
          expect(question[:attributes]).to have_key(:text)
          expect(question[:relationships][:answers][:data]).count.to eq(3)

          question[:relationships][:answers][:data].each do |answer|
            expect(answer[:type]).to eq("answer")
            expect(answer[:attributes].to have_key(:text))
            expect(answer[:id]).to be_a(String)
          end
        end
      end
    end

    context "with invalid request" do
      it "returns 404 for an invalid endpoint" do
        get "/api/v1/questionz"
      
        expect(response.status).to eq(404)
      end
    end

    context "with empty database" do 
      it "returns an empty array if there are no questions" do 
        Question.destroy_all 

        get "api/v1/questions"

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data]).to eq([])
        expect(json[:message]).to eq("No questions available at this time.")
      end
    end
  end 
end