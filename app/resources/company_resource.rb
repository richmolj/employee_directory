class CompanyResource < ApplicationResource
  attribute :name, :string

  has_many :addresses
end
