module Concerns::ConfigurationGem
    extend ActiveSupport::Concern

    included do
        attr_reader :preferences_obj
        before_save :update_preferences

        def init_configuration
            if self.preferences.nil?
                self.preferences = "{}"
            end
            @preferences_obj = eval(self.preferences)
            self
        end

        def get_preferences_obj
            @preferences_obj ||= init_configuration.preferences_obj
            @preferences_obj
        end

        def method_missing name, *args, &block
            name_attribute = name.to_s
            return super(name, *args, &block) if !name_attribute.include?("is_") || !name_attribute.include?("_like_")
            name_attribute = name_attribute.gsub("?", "").gsub("is_", "")
            data = name_attribute.split("_like_")
            binding.pry
            return super(name, *args, &block) unless get_preferences_obj.include?(data[0])
            get_preferences_obj[data[0]] == eval(data[1])
        end

        def set_opt opt, value
            get_preferences_obj()[opt]= value
            self
        end

        def update_preferences
            self.preferences = @preferences_obj.to_s
        end

        class << self
            def get_configuration
                config = first_or_initialize
                config.init_configuration
            end
        end
    end
end