require 'rails_helper'

RSpec.describe "asset_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/asset_types/#{asset_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:asset_type) { create(:asset_type) }

    it 'works' do
      expect(AssetTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('asset_types')
      expect(d.id).to eq(asset_type.id)
    end
  end
end
