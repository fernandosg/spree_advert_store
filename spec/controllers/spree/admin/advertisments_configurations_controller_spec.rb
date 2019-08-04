module Spree
    module Admin
      RSpec.describe AdvertismentsConfigurationsController, type: :controller do
        let(:user) { create(:user) }
        let(:product) { create(:product) }
        let(:advertisment_configurations_params_enable) do
          { advertisments_configuration: { preferences: 
          "{enable: true}"}, action: "Update"}
        end

        let(:advertisment_configurations_params_disable) do
            { advertisments_configuration: { preferences: 
            "{enable: false}"}, action: "Update"}
          end
  
        context '#configure' do
          stub_authorization!
  
          it 'renders the configure template' do
            spree_get :configure
            expect(response.status).to be(200)
            expect(response).to render_template(:configure)
          end
        end
  
        context '#update' do
          stub_authorization!
  
          it 'Update the advertisment extension like enable' do
            spree_post :configure, advertisment_configurations_params_enable
            expect(Spree::AdvertismentsConfiguration.is_enable?).to be_truthy
          end
  
          it 'flashes the notice' do
            spree_post :configure, advertisment_configurations_params_enable
            expect(flash[:notice]).to eq Spree.t(:advertisment_configuration_sucessfuly_updated)
          end

          it 'Update the advertisment extension like disable' do            
            spree_post :configure, advertisment_configurations_params_disable
            expect(Spree::AdvertismentsConfiguration.is_enable?).to be_falsy
          end
  
          it 'flashes the notice' do
            spree_post :configure, advertisment_configurations_params_disable
            expect(flash[:notice]).to eq Spree.t(:advertisment_configuration_sucessfuly_updated)
          end
        end
      end
    end
  end
  