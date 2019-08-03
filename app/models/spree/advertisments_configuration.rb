class Spree::AdvertismentsConfiguration < ApplicationRecord
    def enable
        self.preferences['enable'] = true
    end

    def disable
        self.preferences['enable'] = false
    end

    def is_enable?
        self.preferences['enable'] == true
    end

    def is_disable?        
        self.preferences['enable'] == false
    end
end
