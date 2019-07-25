require 'rails_helper'

RSpec.describe EmployeeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EmployeeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Employee.count }.by(1)
    end

    context 'when assigning a faux user' do
      before do
        payload[:data][:relationships] = {
          user: { data: { id: 123, type: 'users' } }
        }
      end

      it 'works' do
        instance.save
        expect(Employee.last.user_id).to eq(123)
      end
    end
  end

  describe 'updating' do
    let!(:employee) { create(:employee, age: 20) }

    let(:payload) do
      {
        data: {
          id: employee.id.to_s,
          type: 'employees',
          attributes: {
            first_name: 'updated firstname',
            last_name: 'updated lastname',
            age: 70
          }
        }
      }
    end

    let(:instance) do
      EmployeeResource.find(payload)
    end

    it 'works' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { employee.reload.updated_at }
       .and change { employee.first_name }.to('updated firstname')
       .and change { employee.last_name }.to('updated lastname')
       .and change { employee.age }.to(70)
    end
  end

  describe 'destroying' do
    let!(:employee) { create(:employee) }

    let(:instance) do
      EmployeeResource.find(id: employee.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Employee.count }.by(-1)
    end
  end
end
