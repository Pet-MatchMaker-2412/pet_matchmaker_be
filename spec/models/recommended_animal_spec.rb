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

      g_submission = build(:questionnaire_submission, recommended_animal: nil)
      g_submission_answers = [1, 4, 7, 10, 16, 19, 24, 25, 28, 32].map do |answer_id|
        build(:submission_answer, questionnaire_submission: g_submission, answer: Answer.find(answer_id))
      end

      c_submission = build(:questionnaire_submission, recommended_animal: nil)
      c_submission_answers = [3, 6, 9, 10, 16, 20, 22, 25, 29, 33].map do |answer_id|
        build(:submission_answer, questionnaire_submission: c_submission, answer: Answer.find(answer_id))
      end

      golden = described_class.find_by(animal_type: "Golden Retriever")
      cat = described_class.find_by(animal_type: "Cat")

      expect(described_class.calculate_animal(g_submission_answers)).to eq(golden)
      expect(described_class.calculate_animal(c_submission_answers)).to eq(cat)
    end
  end
end
