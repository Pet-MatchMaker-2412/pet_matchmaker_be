require "rails_helper"

RSpec.describe RecommendedAnimalsWeight, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :recommended_animal }
    it { is_expected.to belong_to :answer }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_numericality_of(:weight).is_in(0..1) }
  end
end
