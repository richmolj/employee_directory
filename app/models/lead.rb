class Lead < ApplicationRecord
  belongs_to :user, optional: true
  has_many :wanteds, class_name: 'LeadWanted'
end
