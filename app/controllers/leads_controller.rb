class LeadsController < ApplicationController
  def index
    leads = LeadResource.all(params)
    respond_with(leads)
  end

  def show
    lead = LeadResource.find(params)
    respond_with(lead)
  end

  def create
    lead = LeadResource.build(params)

    if lead.save
      render jsonapi: lead, status: 201
    else
      render jsonapi_errors: lead
    end
  end

  def update
    lead = LeadResource.find(params)

    if lead.update_attributes
      render jsonapi: lead
    else
      render jsonapi_errors: lead
    end
  end

  def destroy
    lead = LeadResource.find(params)

    if lead.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: lead
    end
  end
end
