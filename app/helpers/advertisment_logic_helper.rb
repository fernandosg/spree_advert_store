module AdvertismentLogicHelper

  def get_advertisment_by_code code
    return Spree::Advertisment.None if code.nil?
    return Spree::Advertisment.find_by_code_and_active(code, true)
  end

  def get_advertisment_content_by_code code
    advertisment = get_advertisment_by_code code
    return "" if advertisment.nil?
    return image_tag(advertisment.content) if advertisment.is_an_image?
    return content_tag("span", advertisment.content) if advertisment.is_a_text?
    return video_tag(advertisment.content) if advertisment.is_a_video?
    return ""
  end
end
