require 'rails_helper'

RSpec.describe AssetTypeResource, type: :resource do
  describe 'serialization' do
    let!(:asset_type) { create(:asset_type) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(asset_type.id)
      expect(data.jsonapi_type).to eq('asset_types')
    end
  end

  describe 'filtering' do
    let!(:asset_type1) { create(:asset_type) }
    let!(:asset_type2) { create(:asset_type) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: asset_type2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([asset_type2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:asset_type1) { create(:asset_type) }
      let!(:asset_type2) { create(:asset_type) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            asset_type1.id,
            asset_type2.id
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
            asset_type2.id,
            asset_type1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
