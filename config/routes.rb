Rails.application.routes.draw do
  namespace :api, details: { format: :json } do
    resource :profile, only: [:create, :show]
  end
end
