Spree::Taxon.class_eval do
  include Concerns::Advertisable
  include Concerns::AdvertisableInformation
end
