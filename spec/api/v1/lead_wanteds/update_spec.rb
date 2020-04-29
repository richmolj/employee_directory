require 'rails_helper'

RSpec.describe "lead_wanteds#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/lead_wanteds/#{lead_wanted.id}", payload
  end

  describe 'basic update' do
    let!(:lead_wanted) { create(:lead_wanted) }

    let(:payload) do
      {
        data: {
          id: lead_wanted.id.to_s,
          type: 'lead_wanteds',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LeadWantedResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { lead_wanted.reload.attributes }
    end
  end
end
