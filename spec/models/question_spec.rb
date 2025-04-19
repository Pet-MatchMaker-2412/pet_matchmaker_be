require "rails_helper"

RSpec.describe Question, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :answers }
  end
end
