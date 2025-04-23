require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many :questionnaire_submissions }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  describe 'find_user_by_username' do 
    let!(:user) { create(:user, username: "test_user") }
    let(:valid_json) { { "username" => "test_user" }.to_json }
    let(:invalid_json) { "invalid_json" }
    let(:missing_username_json) { { "username" => "" }.to_json }

    context 'when the username is successfully found' do
      it 'returns the user' do
        result = User.find_user_by_username(valid_json)
        expect(result).to eq(user)
      end
    end
  end
end
