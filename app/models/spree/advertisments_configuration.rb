class Spree::AdvertismentsConfiguration < ApplicationRecord
    include Concerns::ConfigurationGem
    
    def self.enable
        get_configuration.set_opt("enable", true).save
    end

    def self.disable
        get_configuration.set_opt("enable", false).save
    end

    def self.is_enable?
        get_configuration.is_enable_like_true?
    end

    def self.is_disable?
        get_configuration.is_enable_like_false?
    end

    def self.set_preferences preferences
        config = get_configuration.set_preferences_obj preferences
        config.save
    end
end
