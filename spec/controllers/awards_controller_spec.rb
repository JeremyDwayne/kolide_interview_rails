# frozen_string_literal: true

require "rails_helper"

RSpec.describe(AwardsController, type: :controller) do
  let(:valid_attributes) do
    { name: "Fewest Hairballs in Play" }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe "GET #index" do
    it "returns a success response" do
      Award.create!(valid_attributes)
      get :index, params: {}
      expect(response).to(be_successful)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      award = Award.create!(valid_attributes)
      get :show, params: { id: award.to_param }
      expect(response).to(be_successful)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Award" do
        expect do
          post(:create, params: { award: valid_attributes })
        end.to(change(Award, :count).by(1))
      end
    end

    context "with invalid params" do
      it "does not create a new Award" do
        expect do
          post(:create, params: { award: invalid_attributes })
        end.to(change(Award, :count).by(0))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: "Fewest Hairballs in Play" }
      end

      it "updates the requested award" do
        award = Award.create!(valid_attributes)
        put :update, params: { id: award.to_param, award: new_attributes }
        award.reload
        expect(award.name).to(eq("Fewest Hairballs in Play"))
      end
    end

    context "with invalid params" do
      it "does not update the award" do
        award = Award.create!(valid_attributes)
        put :update, params: { id: award.to_param, award: invalid_attributes }
        award.reload
        expect(award.name).not_to(be_nil)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested award" do
      award = Award.create!(valid_attributes)
      expect do
        delete(:destroy, params: { id: award.to_param })
      end.to(change(Award, :count).by(-1))
    end
  end
end
