class Spree::Advertisment < ApplicationRecord
  belongs_to :advrt_rf, polymorphic: true
  validates_presence_of :code, :content
end
