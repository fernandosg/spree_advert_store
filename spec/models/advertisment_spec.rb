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

  context "Logic for advertisments by product model" do
    let(:advertisment_product) {create(:spree_advertisment, :by_product)}

    it "successfully return a records of advertisments for product" do
      expect(advertisment_product.advrt_rf.get_advertise(advertisment_product.code)).not_to be_empty
    end

    it "successfully return an empty records of advertisments for product" do
      product = create(:product)
      expect(product.get_advertise(advertisment_product.code)).to be_empty
    end
  end

  context "Logic for advertisments by taxon model" do
    let(:advertisment_taxon) {create(:spree_advertisment, :by_taxon)}
    it "successfully return a records of advertisments for taxon" do
      expect(advertisment_taxon.advrt_rf.get_advertise(advertisment_taxon.code)).not_to be_empty
    end

    it "successfully return an empty records of advertisments for taxon" do
      taxon = create(:taxon)
      expect(taxon.get_advertise(advertisment_taxon.code)).to be_empty
    end
  end
end
