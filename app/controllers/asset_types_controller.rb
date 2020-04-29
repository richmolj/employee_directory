class AssetTypesController < ApplicationController
  def index
    asset_types = AssetTypeResource.all(params)
    respond_with(asset_types)
  end

  def show
    asset_type = AssetTypeResource.find(params)
    respond_with(asset_type)
  end

  def create
    asset_type = AssetTypeResource.build(params)

    if asset_type.save
      render jsonapi: asset_type, status: 201
    else
      render jsonapi_errors: asset_type
    end
  end

  def update
    asset_type = AssetTypeResource.find(params)

    if asset_type.update_attributes
      render jsonapi: asset_type
    else
      render jsonapi_errors: asset_type
    end
  end

  def destroy
    asset_type = AssetTypeResource.find(params)

    if asset_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: asset_type
    end
  end
end
