class ContactResource < ApplicationResource
  attribute :name, :string

  belongs_to :company
end
