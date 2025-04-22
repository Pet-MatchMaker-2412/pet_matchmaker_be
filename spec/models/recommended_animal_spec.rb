require "rails_helper"

RSpec.describe RecommendedAnimal, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :questionnaire_submissions }
    it { is_expected.to have_many :recommended_animals_weights }
  end

  describe 'validations' do
    it { should validate_presence_of(:petf_type) }
    it { should validate_presence_of(:photo_url) }
    it { should_not validate_presence_of(:petf_breed) }
  end
end
