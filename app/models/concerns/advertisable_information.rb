module Concerns::AdvertisableInformation
  extend ActiveSupport::Concern

  included do
    def get_advertise code
      return Spree::Advertisment.None if code.nil?
      return spree_advertisment.where(code: code, active: true)
    end
  end
end
