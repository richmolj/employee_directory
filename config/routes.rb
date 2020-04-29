Rails.application.routes.draw do
  resources :leads
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :asset_types
    resources :lead_wanteds
    resources :leads
    mount VandalUi::Engine, at: '/vandal'

    resources :milestones
    resources :tasks
    resources :notes
    resources :teams
    resources :departments
    resources :positions
    resources :employees
  end
end
