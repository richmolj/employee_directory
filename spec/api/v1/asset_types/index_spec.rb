require 'rails_helper'

RSpec.describe "asset_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/asset_types", params: params
  end

  describe 'basic fetch' do
    let!(:asset_type1) { create(:asset_type) }
    let!(:asset_type2) { create(:asset_type) }

    it 'works' do
      expect(AssetTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['asset_types'])
      expect(d.map(&:id)).to match_array([asset_type1.id, asset_type2.id])
    end
  end
end
