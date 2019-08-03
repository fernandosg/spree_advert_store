require 'spec_helper'

RSpec.describe "Spree::AdvertismentsConfiguration", :type => :model do
    context "check attribute" do
        let(:advertisment_configuration) {create(:spree_advertisment_configuration)}

        it "enable if preference enable is true" do
            Spree::AdvertismentsConfiguration.enable
            expect(Spree::AdvertismentsConfiguration.is_enable?).to be_truthy
        end

        it "enable if preference enable is false" do
            Spree::AdvertismentsConfiguration.disable
            expect(Spree::AdvertismentsConfiguration.is_enable?).to be_falsy
        end
    end
end