require 'rails_helper'

RSpec.describe "asset_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/asset_types/#{asset_type.id}", payload
  end

  describe 'basic update' do
    let!(:asset_type) { create(:asset_type) }

    let(:payload) do
      {
        data: {
          id: asset_type.id.to_s,
          type: 'asset_types',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AssetTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { asset_type.reload.attributes }
    end
  end
end
