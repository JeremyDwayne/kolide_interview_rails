# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Player, type: :model) do
  let(:valid_attributes) do
    {
      name: "John Doe",
      description: "A player",
      location: "New York, NY",
      total_points: 12,
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

    it "must have a positive total_points" do
      player = described_class.create(valid_attributes.merge(total_points: -1))
      expect(player).not_to(be_valid)
      expect(player.errors[:total_points]).to(include("must be greater than or equal to 0"))
    end

    it "must have a total_points between 0-100" do
      player = described_class.create(valid_attributes.merge(total_points: 101))
      expect(player).not_to(be_valid)
      expect(player.errors[:total_points]).to(include("must be less than or equal to 100"))
    end
  end

  describe "#player_rank" do
    it "returns the correct rank" do
      player1 = described_class.create!(name: "Player 1", total_points: 50)
      player2 = described_class.create!(name: "Player 2", total_points: 100)
      expect(player1.player_rank).to(eq(2))
      expect(player2.player_rank).to(eq(1))
    end
  end

  describe "#set_rank" do
    it "correctly on create" do
      player1 = described_class.create!(name: "Player 1", total_points: 50)
      described_class.create!(name: "Player 2", total_points: 70)
      player1.set_rank
      expect(player1.rank).to(eq(2))
    end

    it "is called after total_points is updated" do
      player = described_class.create!(name: "Player 1", total_points: 50)
      described_class.create!(name: "Player 2", total_points: 70)
      allow(player).to(receive(:set_rank))
      player.update(total_points: 100)
      expect(player.rank).to(eq(1))
      expect(player).to(have_received(:set_rank))
    end
  end

  describe "scopes" do
    let!(:player1) { described_class.create(valid_attributes.merge(total_points: 10)) }
    let(:player2) { described_class.create(valid_attributes.merge(total_points: 20)) }
    let!(:player3) { described_class.create(valid_attributes.merge(total_points: 30)) }

    it "top_player" do
      expect(described_class.top_player).to(eq(player3))
    end

    it "bottom_player" do
      expect(described_class.bottom_player).to(eq(player1))
    end

    it "season_average" do
      expect(described_class.season_average).to(eq(20))
    end
  end
end
