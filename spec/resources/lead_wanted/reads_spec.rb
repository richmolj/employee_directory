require 'rails_helper'

RSpec.describe LeadWantedResource, type: :resource do
  describe 'serialization' do
    let!(:lead_wanted) { create(:lead_wanted) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(lead_wanted.id)
      expect(data.jsonapi_type).to eq('lead_wanteds')
    end
  end

  describe 'filtering' do
    let!(:lead_wanted1) { create(:lead_wanted) }
    let!(:lead_wanted2) { create(:lead_wanted) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: lead_wanted2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([lead_wanted2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:lead_wanted1) { create(:lead_wanted) }
      let!(:lead_wanted2) { create(:lead_wanted) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            lead_wanted1.id,
            lead_wanted2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            lead_wanted2.id,
            lead_wanted1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
