require 'rails_helper'

RSpec.describe LeadResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'leads',
          attributes: attributes_for(:lead)
        }
      }
    end

    let(:instance) do
      LeadResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Lead.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:lead) { create(:lead) }

    let(:payload) do
      {
        data: {
          id: lead.id.to_s,
          type: 'leads',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      LeadResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { lead.reload.updated_at }
      # .and change { lead.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:lead) { create(:lead) }

    let(:instance) do
      LeadResource.find(id: lead.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Lead.count }.by(-1)
    end
  end
end
