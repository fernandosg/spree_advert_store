module Spree
  module Admin
    RSpec.describe AdvertismentsController, type: :controller do
      let(:user) { create(:user) }
      let(:product) { create(:product) }
      let(:taxon) { create(:taxon) }
      let(:advertisment_params) do
        { product_id: product.slug,
          advertisment: { code: 'check2',
                    type_advertisement: 'image',
                    content: "checkingimage.jpg",
                    advrt_rf_id: product.id,
                    advrt_rf_type: 'Spree::Product'
                  } }
      end

      context '#new' do
        stub_authorization!

        it 'renders the new template' do
          spree_get :new
          expect(response.status).to be(200)
          expect(response).to render_template(:new)
        end
      end

      context '#create' do
        stub_authorization!

        it 'creates a new advertisment' do
          expect {
            spree_post :create, advertisment_params
          }.to change(Spree::Advertisment, :count).by(1)
        end

        it 'flashes the notice' do
          spree_post :create, advertisment_params
          expect(flash[:success]).to eq Spree.t(:advertisment_successfully_created)
        end
      end
    end
  end
end
