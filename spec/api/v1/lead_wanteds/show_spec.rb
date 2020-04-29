require 'rails_helper'

RSpec.describe "lead_wanteds#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/lead_wanteds/#{lead_wanted.id}", params: params
  end

  describe 'basic fetch' do
    let!(:lead_wanted) { create(:lead_wanted) }

    it 'works' do
      expect(LeadWantedResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('lead_wanteds')
      expect(d.id).to eq(lead_wanted.id)
    end
  end
end
