class LeadWantedResource < ApplicationResource
  belongs_to :lead
  belongs_to :asset_type

  def base_scope
    LeadWanted.joins(:lead).merge(current_user.leads)
  end
end
