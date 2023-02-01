require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  describe "pharmacy creation" do
    let(:pharmacy) { create :pharmacy }
    it "is valid with valid attributes" do
      expect(pharmacy).to be_valid
    end
  end
end
