class CompaniesController < ApplicationController
  def index
    companies = CompanyResource.all(params)
    respond_with(companies)
  end

  def show
    company = CompanyResource.find(params)
    respond_with(company)
  end

  def create
    company = CompanyResource.build(params)

    if company.save
      render jsonapi: company, status: 201
    else
      render jsonapi_errors: company
    end
  end

  def update
    company = CompanyResource.find(params)

    if company.update_attributes
      render jsonapi: company
    else
      render jsonapi_errors: company
    end
  end

  def destroy
    company = CompanyResource.find(params)

    if company.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: company
    end
  end
end
