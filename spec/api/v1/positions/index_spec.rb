require 'rails_helper'

RSpec.describe "positions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/positions", params: params
  end

  before do
    GraphitiErrors.enable!
  end

  describe 'basic fetch' do
    let!(:position1) { create(:position) }
    let!(:position2) { create(:position) }

    it 'works' do
      expect(PositionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(401)
      expect(json['errors'][0]['meta']['redirect_uri']).to eq("FooError")
    end

    # Todo - dont use RR
    context 'turning off' do
      before do
        #handle_request_exceptions(false)
        GraphitiErrors.disable!
      end

      it 'raises error' do
        expect { make_request }.to raise_error(FooError)
      end

      context 'and back on' do
        before do
          GraphitiErrors.enable!
        end

        it 'renders' do
          make_request
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
