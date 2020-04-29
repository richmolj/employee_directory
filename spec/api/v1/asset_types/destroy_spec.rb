require 'rails_helper'

RSpec.describe "asset_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/asset_types/#{asset_type.id}"
  end

  describe 'basic destroy' do
    let!(:asset_type) { create(:asset_type) }

    it 'updates the resource' do
      expect(AssetTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AssetType.count }.by(-1)
      expect { asset_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
