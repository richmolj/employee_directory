require 'rails_helper'

RSpec.describe "contacts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/contacts", payload
  end

  describe 'the issue' do
    let(:payload) do
      {
        data: {
          type: 'contacts',
          attributes: { name: 'adf' },
          relationships: {
            company: {
              data: {
                :'temp-id' => 'a',
                type: 'companies',
                method: 'create'
              }
            }
          }
        },
        included: [
          {
            :'temp-id' => 'a',
            type: 'companies',
            attributes: { name: 'asdf' },
            relationships: {
              addresses: {
                data: [
                  {
                    type: 'addresses',
                    :'temp-id' => 'b',
                    method: 'create'
                  }
                ]
              }
            }
          },
          {
            :'temp-id' => 'b',
            type: 'addresses',
            attributes: {}
          }
        ]
      }
    end

    it 'works' do
      expect(ContactResource).to receive(:build).and_call_original
      make_request
      binding.pry
    end
  end
end
