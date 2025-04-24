require "rails_helper"

RSpec.describe QuestionnaireSubmission, type: :model do
  describe "Relationships" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recommended_animal }
    it { is_expected.to have_many :submission_answers }
  end

  describe "Instance Methods" do
    let(:submission) { described_class.new }

    it "#add_answers" do
      answer_ids = create_list(:answer, 10).map { |a| a.id }

      submission.add_answers(answer_ids)

      expect(submission.submission_answers.length).to eq(10)
    end
  end
end
