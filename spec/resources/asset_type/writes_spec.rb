require 'rails_helper'

RSpec.describe AssetTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'asset_types',
          attributes: attributes_for(:asset_type)
        }
      }
    end

    let(:instance) do
      AssetTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AssetType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:asset_type) { create(:asset_type) }

    let(:payload) do
      {
        data: {
          id: asset_type.id.to_s,
          type: 'asset_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AssetTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { asset_type.reload.updated_at }
      # .and change { asset_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:asset_type) { create(:asset_type) }

    let(:instance) do
      AssetTypeResource.find(id: asset_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AssetType.count }.by(-1)
    end
  end
end
