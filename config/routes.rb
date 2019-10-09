Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :addresses
    resources :companies
    resources :contacts
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
