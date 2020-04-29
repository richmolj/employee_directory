require 'rails_helper'

RSpec.describe "leads#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/leads/#{lead.id}", params: params
  end

  describe 'basic fetch' do
    let!(:lead) { create(:lead) }

    it 'works' do
      expect(LeadResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('leads')
      expect(d.id).to eq(lead.id)
    end
  end
end
