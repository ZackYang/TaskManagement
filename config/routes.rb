Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      jsonapi_resources :employees, only: [:index, :show] do
        jsonapi_related_resources :tasks
      end

      jsonapi_resources :tasks, only: [:index, :show] do
        jsonapi_related_resources :employees
      end
    end
  end

end
