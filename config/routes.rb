Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    resource :profile, only: [:create, :show]

    resources :forums  do
      resources :topics, only: [:create, :update, :destroy, :show] do
        resources :discussion, only: [:create, :destroy, :update]
      end
    end
  end
end
