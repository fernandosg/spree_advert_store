module Spree
    module Admin
      RSpec.describe AdvertismentConfiguration, type: :controller do
        let(:user) { create(:user) }
        let(:product) { create(:product) }
        let(:advertisment_configurations_params_enable) do
          { advertisment_configuration: { preferences: 
          {enable: true}}}
        end

        let(:advertisment_configurations_params_disable) do
            { advertisment_configuration: { preferences: 
            {enable: false}}}
          end
  
        context '#configure' do
          stub_authorization!
  
          it 'renders the new template' do
            spree_get :configure
            expect(response.status).to be(200)
            expect(response).to render_template(:configure)
          end
        end
  
        context '#update' do
          stub_authorization!
  
          it 'Update the advertisment extension like enable' do
            expect {
              spree_post :configure, advertisment_configurations_params_enable
            }.to change(Spree::AdvertismentConfiguration, :is_enable?).by(true)
          end
  
          it 'flashes the notice' do
            spree_post :configure, advertisment_configurations_params_enable
            expect(flash[:success]).to eq Spree.t(:advertisment_configuration_sucessfuly_updated)
          end

          it 'Update the advertisment extension like enable' do
            expect {
              spree_post :configure, advertisment_configurations_params_disable
            }.to change(Spree::AdvertismentConfiguration, :is_enable?).by(true)
          end
  
          it 'flashes the notice' do
            spree_post :configure, advertisment_configurations_params_disable
            expect(flash[:success]).to eq Spree.t(:advertisment_configuration_sucessfuly_updated)
          end
        end
      end
    end
  end
  