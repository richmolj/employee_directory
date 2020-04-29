class AssetTypeResource < ApplicationResource
  attribute :reference_code, :string

  has_many :wanteds, resource: LeadWantedResource

  def base_scope
    current_user.asset_types
  end
end
