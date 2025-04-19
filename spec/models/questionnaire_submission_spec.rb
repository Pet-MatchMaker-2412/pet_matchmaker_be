require "rails_helper"

RSpec.describe QuestionnaireSubmission, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recommended_animal }
    it { is_expected.to have_many :submission_answers }
  end
end
