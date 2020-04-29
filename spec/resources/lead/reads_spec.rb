require 'rails_helper'

RSpec.describe LeadResource, type: :resource do
  describe 'serialization' do
    let!(:lead) { create(:lead) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(lead.id)
      expect(data.jsonapi_type).to eq('leads')
    end
  end

  describe 'filtering' do
    let!(:lead1) { create(:lead) }
    let!(:lead2) { create(:lead) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: lead2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([lead2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:lead1) { create(:lead) }
      let!(:lead2) { create(:lead) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            lead1.id,
            lead2.id
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
            lead2.id,
            lead1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
