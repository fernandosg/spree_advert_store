class Spree::Admin::AdvertismentsConfigurationsController < Spree::Admin::ResourceController
    
    def configure
        unless params[:advertisments_configuration].nil?
            update_configuration
        else
            @object = Spree::AdvertismentsConfiguration.get_configuration
        end
    end

    def update_configuration
        preferences_param = permitted_params[:preferences]
        if permitted_params[:preferences].is_a?(String)
            preferences_param = eval(permitted_params[:preferences])
        end
        if @model_class.set_preferences preferences_param
            return respond_to do |format|
                flash[:notice] = Spree.t(:advertisment_configuration_sucessfuly_updated)
                format.html {redirect_to admin_advertisments_configurations_url}
            end
        else
            flash[:notice] = Spree.t(:advertisment_configuration_error_updated)
            render "configure"
        end
        
    end

    def model_class
        @model_class ||= Spree::AdvertismentsConfiguration
    end

    
    private
    def permitted_params
       #params.require("advertisments_configuration").permit(:preferences=> [:enable])
       params.require("advertisments_configuration").permit(:preferences)
    end

end