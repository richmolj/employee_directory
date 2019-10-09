require 'rails_helper'

RSpec.describe "companies#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/companies", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:company)
    end
    let(:payload) do
      {
        data: {
          type: 'companies',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CompanyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Company.count }.by(1)
    end
  end
end
