class Address < ApplicationRecord
  belongs_to :company, optional: true

  validates :street, presence: true
end
