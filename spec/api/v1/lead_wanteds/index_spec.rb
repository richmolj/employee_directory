require 'rails_helper'

RSpec.describe "lead_wanteds#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/lead_wanteds", params: params
  end

  describe 'basic fetch' do
    let!(:lead_wanted1) { create(:lead_wanted) }
    let!(:lead_wanted2) { create(:lead_wanted) }

    it 'works' do
      expect(LeadWantedResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['lead_wanteds'])
      expect(d.map(&:id)).to match_array([lead_wanted1.id, lead_wanted2.id])
    end
  end
end
