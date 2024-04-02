# frozen_string_literal: true

require "rails_helper"

RSpec.describe(PlayersController, type: :controller) do
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
    }
  end

  let(:update_attributes) do
    {
      name: "John Doe",
      description: "A good player",
      location: "NYC, NY",
      total_points: 23,
    }
  end

  describe "GET #index" do
    it "returns a success response" do
      Player.create!(valid_attributes)
      get :index, params: {}
      expect(response).to(be_successful)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      player = Player.create!(valid_attributes)
      get :show, params: { id: player.to_param }
      expect(response).to(be_successful)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Player" do
        expect do
          post(:create, params: { player: valid_attributes })
        end.to(change(Player, :count).by(1))
      end
    end

    context "with invalid params" do
      it "does not create a new Player" do
        expect do
          post(:create, params: { player: invalid_attributes })
        end.to(change(Player, :count).by(0))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested player" do
        player = Player.create!(valid_attributes)
        put :update, params: { id: player.to_param, player: update_attributes }
        player.reload
        expect(player.description).to(eq("A good player"))
        expect(player.location).to(eq("NYC, NY"))
        expect(player.total_points).to(eq(23))
      end

      it "updates the requested player and their rank" do
        skip "#update_rank is not working as expected"
        player = Player.create!(valid_attributes)
        player2 = Player.create!(name: "Player 2", total_points: 15)
        expect(player2.rank).to(eq(1))
        put :update, params: { id: player.to_param, player: { total_points: 20 } }
        player.reload
        expect(player.total_points).to(eq(20))
        expect(player.rank).to(eq(1))
        player2.update_rank
        expect(player2.rank).to(eq(2))
      end
    end

    context "with invalid params" do
      it "does not update the player" do
        player = Player.create!(valid_attributes)
        put :update, params: { id: player.to_param, player: invalid_attributes }
        player.reload
        expect(player.name).not_to(be_nil)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested player" do
      player = Player.create!(valid_attributes)
      expect do
        delete(:destroy, params: { id: player.to_param })
      end.to(change(Player, :count).by(-1))
    end
  end
end
