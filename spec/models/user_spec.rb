require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validating' do
    describe 'presence of' do
      subject { create(:user) }
      it { is_expected.to validate_presence_of(:identification_document) }
      it { is_expected.to validate_uniqueness_of(:identification_document)
                            .case_insensitive }
    end
  end
end
