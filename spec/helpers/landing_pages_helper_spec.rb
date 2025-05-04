require 'rails_helper'

RSpec.describe LandingPagesHelper, type: :helper do
  describe "#title" do
    it "returns the title" do
      expect(helper.title).to eq("Budget Categorizer")
    end
  end
end
