# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Award, type: :model) do
  it "is valid with valid attributes" do
    award = described_class.new(name: "Fewest Hairballs in Play")
    expect(award).to(be_valid)
  end

  it "is not valid without a name" do
    award = described_class.new(name: nil)
    expect(award).not_to(be_valid)
  end
end
