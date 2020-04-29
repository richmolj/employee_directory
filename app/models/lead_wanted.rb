class LeadWanted < ApplicationRecord
  belongs_to :lead, optional: true
  belongs_to :asset_type, optional: true
end
