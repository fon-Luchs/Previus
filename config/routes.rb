Rails.application.routes.draw do
  namespace :api, details: { format: :json } do
    resource :session, only: [:create, :destroy]
    resource :profile, only: [:create, :show]
  end
end
