require 'rails_helper'

RSpec.describe "leads#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/leads", payload
  end

  let!(:user) { create(:user) }
  let!(:other_asset_type) { create(:asset_type, reference_code: 'dontchangeme', user_id: user.id) }
  let!(:asset_type) { create(:asset_type, reference_code: 'changeme', user_id: user.id) }

  describe 'elDub' do
    let(:payload) do
      {
        data: {
          type: 'leads',
          attributes: {
            channel: 'manual'
          },
          relationships: {
            wanteds: {
              data: [
                {
                  type: 'lead_wanteds',
                  :'temp-id' => 'temp-id-28',
                  method: 'create'
                },
                {
                  type: 'lead_wanteds',
                  :'temp-id' => 'temp-id-31',
                  method: 'create'
                }
              ]
            }
          }
        },
        included: [
          {
            type: 'lead_wanteds',
            :'temp-id' => 'temp-id-28',
            relationships: {
              asset_type: {
                data: {
                  type: 'asset_types',
                  id: asset_type.id,
                  method: 'update'
                }
              }
            }
          },
          {
            type: 'asset_types',
            id: asset_type.id,
            attributes: {
              reference_code: 'IMC'
            }
          },
          {
            type: 'lead_wanteds',
            :'temp-id' => 'temp-id-31',
            relationships: {
              asset_type: {
                data: {
                  type: 'asset_types',
                  id: asset_type.id,
                  method: 'update'
                }
              }
            }
          },
          {
            type: 'asset_types',
            id: asset_type.id,
            attributes: {
              reference_code: 'IMC'
            }
          }
        ]
      }
    end

    it 'works' do
      make_request
      expect(asset_type.reference_code).to eq('changeme')
      expect(other_asset_type.reference_code).to eq('dontchangeme')
      expect(LeadWanted.first.asset_type_id).to eq(asset_type.id)
      expect(LeadWanted.last.asset_type_id).to eq(asset_type.id)
    end
  end
end
