require "rails_helper"

RSpec.describe RecommendedAnimal, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :questionnaire_submissions }
    it { is_expected.to have_many :recommended_animals_weights }
  end
end
