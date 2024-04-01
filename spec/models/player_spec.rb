# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Player, type: :model) do
  let(:valid_attributes) do
    {
      name: "John Doe",
      description: "A player",
      location: "New York, NY",
      total_points: 123,
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      total_points: nil,
      description: "A player",
      location: "New York, NY",
    }
  end

  # Test for presence of necessary attributes
  context "with valid attributes" do
    it "is valid" do
      expect(described_class.create(valid_attributes)).to(be_valid)
    end
  end

  context "with invalid attributes" do
    it "is not valid" do
      expect(described_class.create(invalid_attributes)).not_to(be_valid)
    end
  end
end
