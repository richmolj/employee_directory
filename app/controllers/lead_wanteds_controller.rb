class LeadWantedsController < ApplicationController
  def index
    lead_wanteds = LeadWantedResource.all(params)
    respond_with(lead_wanteds)
  end

  def show
    lead_wanted = LeadWantedResource.find(params)
    respond_with(lead_wanted)
  end

  def create
    lead_wanted = LeadWantedResource.build(params)

    if lead_wanted.save
      render jsonapi: lead_wanted, status: 201
    else
      render jsonapi_errors: lead_wanted
    end
  end

  def update
    lead_wanted = LeadWantedResource.find(params)

    if lead_wanted.update_attributes
      render jsonapi: lead_wanted
    else
      render jsonapi_errors: lead_wanted
    end
  end

  def destroy
    lead_wanted = LeadWantedResource.find(params)

    if lead_wanted.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: lead_wanted
    end
  end
end
