require 'rails_helper'

RSpec.describe "asset_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/asset_types", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:asset_type)
    end
    let(:payload) do
      {
        data: {
          type: 'asset_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AssetTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AssetType.count }.by(1)
    end
  end
end
