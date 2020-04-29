class LeadResource < ApplicationResource
  attribute :channel, :string

  has_many :wanteds, resource: LeadWantedResource

  def base_scope
    current_user.leads
  end
end
