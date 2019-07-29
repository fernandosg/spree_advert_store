class Spree::Advertisment < ApplicationRecord
  belongs_to :advrt_rf, polymorphic: true
  validates_presence_of :code, :content
  TYPES_ADVERTISMENT = ["image?", "video?", "text?"]

  def method_helper_is_knowledge(method_name)
    TYPES_ADVERTISMENT.each do |type|
      if method_name.include?(type)
        return true
      end
    end
    return false
  end

  def method_missing(m, *args, &block)
    return super(m, *args, &block) unless method_helper_is_knowledge(m.to_s)
    type = m.to_s.split("_")[-1]
    return type_advertisement == type.split("?")[0]
  end
end
