require 'spec_helper'

RSpec.describe AdvertismentLogicHelper, :type => :helper do
  describe "tags for advertisment" do
    it "successfully get an image_tag if the code exist" do
      advertisment = create(:spree_advertisment, :by_product, :type_image)
      expect(get_advertisment_content_by_code(advertisment.code).include?("img")).to be_truthy
    end

    it "successfully get a span tag if the code exist" do
      advertisment = create(:spree_advertisment, :by_product, :type_text)
      expect(get_advertisment_content_by_code(advertisment.code).include?("span")).to be_truthy
    end

    it "successfully get a video tag if the code exist" do
      advertisment = create(:spree_advertisment, :by_product, :type_video)
      expect(get_advertisment_content_by_code(advertisment.code).include?("video")).to be_truthy
    end

    it "failure get a video tag if the code exist and was an image" do
      advertisment = create(:spree_advertisment, :by_product, :type_image)
      expect(get_advertisment_content_by_code(advertisment.code).include?("video")).to be_falsy
    end

    it "get an empty string if code doesnt exist" do
      advertisment = create(:spree_advertisment, :by_product, :type_image)
      expect(get_advertisment_content_by_code("checking")).to be_empty
    end
  end
end
