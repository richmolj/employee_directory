require 'rails_helper'

RSpec.describe "leads#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/leads/#{lead.id}"
  end

  describe 'basic destroy' do
    let!(:lead) { create(:lead) }

    it 'updates the resource' do
      expect(LeadResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Lead.count }.by(-1)
      expect { lead.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
