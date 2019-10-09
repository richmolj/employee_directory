require 'rails_helper'

RSpec.describe "employees#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/employees", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: {
            first_name: 'adsf',
            last_name: 'asdf'
          },
          relationships: {
            positions: {
              data: [
                {
                  type: 'positions',
                  :'temp-id' => 'a',
                  method: 'create'
                }
              ]
            }
          }
        },
        included: [
          {
            type: 'positions',
            :'temp-id' => 'a',
            attributes: { title: 'adf' },
            relationships: {
              department: {
                data: {
                  type: 'departments',
                  :'temp-id' => 'b',
                  method: 'create'
                }
              }
            }
          },
          {
            type: 'departments',
            :'temp-id' => 'b',
            attributes: {}
          }
        ]
      }
    end

    it 'works' do
      make_request
      binding.pry
    end
  end
end
