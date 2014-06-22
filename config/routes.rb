Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :recipes, except: [:new, :edit] do
        resources :ingredients, except: [:new, :edit], shallow: true
      end
    end
  end
end
