require "rails_helper"

RSpec.describe SubmissionAnswer, type: :model do
  it { is_expected.to belong_to :questionnaire_submission }
  it { is_expected.to belong_to :answer }
end
