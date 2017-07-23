Rails.application.routes.draw do
  resources :forms, except: %i[show] do
    scope module: :forms do
      resource :preview, only: %i[show create]
      resources :sections, except: %i[show]
      resources :fields, except: %i[show]
    end
  end

  resources :fields, only: %i[] do
    scope module: :fields do
      resource :validations, only: %i[edit update]
      resource :options, only: %i[edit update]
    end
  end

  root to: "forms#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
