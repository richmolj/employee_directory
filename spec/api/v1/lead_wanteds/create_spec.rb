require 'rails_helper'

RSpec.describe "lead_wanteds#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/lead_wanteds", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:lead_wanted)
    end
    let(:payload) do
      {
        data: {
          type: 'lead_wanteds',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(LeadWantedResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { LeadWanted.count }.by(1)
    end
  end
end
