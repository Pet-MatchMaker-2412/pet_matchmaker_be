require "rails_helper"

RSpec.describe RecommendedAnimalsWeight, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :recommended_animal }
    it { is_expected.to belong_to :answer }
  end
end
