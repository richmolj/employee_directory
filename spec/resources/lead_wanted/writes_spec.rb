require 'rails_helper'

RSpec.describe LeadWantedResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'lead_wanteds',
          attributes: attributes_for(:lead_wanted)
        }
      }
    end

    let(:instance) do
      LeadWantedResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { LeadWanted.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:lead_wanted) { create(:lead_wanted) }

    let(:payload) do
      {
        data: {
          id: lead_wanted.id.to_s,
          type: 'lead_wanteds',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      LeadWantedResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { lead_wanted.reload.updated_at }
      # .and change { lead_wanted.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:lead_wanted) { create(:lead_wanted) }

    let(:instance) do
      LeadWantedResource.find(id: lead_wanted.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { LeadWanted.count }.by(-1)
    end
  end
end
