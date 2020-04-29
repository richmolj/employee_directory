require 'rails_helper'

RSpec.describe "leads#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/leads", params: params
  end

  describe 'basic fetch' do
    let!(:lead1) { create(:lead) }
    let!(:lead2) { create(:lead) }

    it 'works' do
      expect(LeadResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['leads'])
      expect(d.map(&:id)).to match_array([lead1.id, lead2.id])
    end
  end
end
