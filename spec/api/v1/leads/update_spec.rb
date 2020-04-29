require 'rails_helper'

RSpec.describe "leads#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/leads/#{lead.id}", payload
  end

  describe 'basic update' do
    let!(:lead) { create(:lead) }

    let(:payload) do
      {
        data: {
          id: lead.id.to_s,
          type: 'leads',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LeadResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { lead.reload.attributes }
    end
  end
end
