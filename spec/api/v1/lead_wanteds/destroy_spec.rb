require 'rails_helper'

RSpec.describe "lead_wanteds#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/lead_wanteds/#{lead_wanted.id}"
  end

  describe 'basic destroy' do
    let!(:lead_wanted) { create(:lead_wanted) }

    it 'updates the resource' do
      expect(LeadWantedResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { LeadWanted.count }.by(-1)
      expect { lead_wanted.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
