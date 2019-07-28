module Concerns::Advertisable
  extend ActiveSupport::Concern
  included do
    has_many :spree_advertisment, :as => :advrt_rf, class_name: 'Spree::Advertisment'
  end
end
