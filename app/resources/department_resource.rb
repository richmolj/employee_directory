class DepartmentResource < ApplicationResource
  attribute :id, :integer_id, writable: false
  attribute :name, :string

  has_many :positions
  has_many :teams
  polymorphic_has_many :notes, as: :notable
end
