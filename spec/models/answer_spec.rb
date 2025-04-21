require "rails_helper"

RSpec.describe Answer, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :question }
    it { is_expected.to have_many :submission_answers }
    it { is_expected.to have_many :recommended_animals_weights }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :text }
  end
end

