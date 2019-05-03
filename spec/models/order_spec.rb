require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validating' do
    describe 'presence of' do
      it { is_expected.to validate_presence_of(:annual_price) }
      it { is_expected.to validate_presence_of(:cellphone_model) }
      it { is_expected.to validate_presence_of(:cellphone_imei) }
      it { is_expected.to belong_to(:user) }
    end
  end
end
