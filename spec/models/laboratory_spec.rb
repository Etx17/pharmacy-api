require 'rails_helper'

RSpec.describe Laboratory, type: :model do
  describe "laboratory creation" do
    let(:laboratory) { create :laboratory }
    it "is valid with valid attributes" do
      expect(laboratory).to be_valid
    end

    it "increments the laboratory count by 1" do
      expect { create :laboratory }.to change { Laboratory.count }.by(1)
    end

    it "is invalid without a name" do
      empty_name_laboratory = Laboratory.create(name: nil, email: Faker::Internet.email)
      expect(empty_name_laboratory).to_not be_valid
    end

    it "is invalid without an email" do
      empty_name_laboratory = Laboratory.create(name: Faker::Company.name, email: nil)
      expect(empty_name_laboratory).to_not be_valid
    end

    it "is invalid if name already exists" do
      laboratory_duplicate = Laboratory.create(name: laboratory.name, email: Faker::Internet.email)
      expect(laboratory_duplicate).to_not be_valid
    end

    it "is invalid if same name with white spaces around" do
      laboratory_duplicate = Laboratory.create(name: " #{laboratory.name} ", email: Faker::Internet.email)
      expect(laboratory_duplicate).to_not be_valid
    end

    it "is invalid if same name with different case" do
      laboratory_duplicate = Laboratory.create(name: " #{laboratory.name.upcase} ", email: Faker::Internet.email)
      expect(laboratory_duplicate).to_not be_valid
    end

    it "is invalid if same email with white spaces around" do
      laboratory_duplicate = Laboratory.create(email: " #{laboratory.email} ", name: Faker::Company.name)
      expect(laboratory_duplicate).to_not be_valid
    end

    it "is invalid if same email with different case" do
      laboratory_duplicate = Laboratory.create(email: " #{laboratory.email.upcase} ", name: Faker::Company.name)
      expect(laboratory_duplicate).to_not be_valid
    end
  end
end
