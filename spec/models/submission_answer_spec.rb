require "rails_helper"

RSpec.describe SubmissionAnswer, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :questionnaire_submission }
    it { is_expected.to belong_to :answer }
    it { is_expected.to have_many(:recommended_animals_weights).through :answer }
  end
end
