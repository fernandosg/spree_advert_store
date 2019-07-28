require "spec_helper"

RSpec.describe "Spree::Advertisment", :type => :model do
  context "creation" do
    let(:advertisment) {create(:spree_advertisment, :by_product)}

    it "successfully if have all necessary attributes" do
      expect(advertisment.save).to be_truthy
    end

    it "failure if not have all necessary attributes" do
      advertisment.code = nil
      advertisment.content = nil
      expect(advertisment.save).to be_falsy
    end
  end
end
