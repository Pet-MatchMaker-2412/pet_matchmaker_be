require "rails_helper"

RSpec.describe RecommendedAnimal, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :questionnaire_submissions }
    it { is_expected.to have_many :recommended_animals_weights }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:petf_type) }
    it { is_expected.to validate_presence_of(:photo_url) }
    it { is_expected.not_to validate_presence_of(:petf_breed) }
  end

  describe "Class Methods" do
    it ".calculate_animal" do
      DatabaseCleaner.clean_with(:truncation)
      load Rails.root.join("db/seeds.rb").to_s

      submission = build(:questionnaire_submission, recommended_animal: nil)
      submission_answers = [1, 4, 7, 10, 16, 19, 24, 25, 28, 32].map do |answer_id|
        build(:submission_answer, questionnaire_submission: submission, answer: Answer.find(answer_id))
      end

      golden = described_class.find_by(animal_type: "Golden Retriever")

      expect(described_class.calculate_animal(submission_answers)).to eq(golden)
    end
  end
end
