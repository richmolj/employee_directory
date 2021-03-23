require 'rails_helper'

RSpec.describe PositionResource, type: :resource do
  describe 'creating' do
    let!(:employee) { create(:employee) }
    let!(:department) { create(:department) }
    let!(:least_recent) { create(:position, employee: employee) }
    let!(:most_recent) { create(:position, employee: employee) }

    let(:payload) do
      {
        data: {
          type: 'positions',
          attributes: { },
          relationships: {
            employee: {
              data: {
                id: employee.id.to_s,
                type: 'employees'
              }
            },
            department: {
              data: {
                id: department.id.to_s,
                type: 'departments'
              }
            }
          }
        }
      }
    end

    let(:instance) do
      PositionResource.build(payload)
    end

    it 'works, updating historical indices' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Position.count }.by(1)
      position = Position.last
      expect(position.historical_index).to eq(1)
      expect(most_recent.reload.historical_index).to eq(2)
      expect(least_recent.reload.historical_index).to eq(3)
    end
  end

  describe 'updating' do
    let!(:position) { create(:position, active: false) }
    let!(:department) { create(:department) }

    let(:payload) do
      {
        data: {
          id: position.id.to_s,
          type: 'positions',
          attributes: {
            title: 'changed!',
            active: true
          },
          relationships: {
            department: {
              data: {
                id: department.id.to_s,
                type: "departments",
                method: "update"
              }
            }
          }
        },
        included: [{
          type: "departments",
          id: department.id.to_s
        }]
      }
    end

    let(:instance) do
      PositionResource.find(payload)
    end

    it 'works' do
      expect(instance.update_attributes).to eq(true)
      p = Position.last
      expect(p.department_id).to eq(department.id)
    end
  end

  describe 'destroying' do
    let!(:employee) { create(:employee) }
    let!(:position1) do
      create(:position, employee: employee, historical_index: 2)
    end
    let!(:position2) { create(:position, employee: employee) }

    let(:instance) do
      PositionResource.find(id: position2.id)
    end

    it 'works, updating historical indices' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Position.count }.by(-1)
      expect(position1.reload.historical_index).to eq(1)
    end
  end
end
