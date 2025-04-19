require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :questionnaire_submissions }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end
end
