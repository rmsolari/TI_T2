Rails.application.routes.draw do
  put '/entries/:id/', to: 'entries#update_put'
  patch 'entries/:id', to: 'entries#update_patch'
  resources :entries do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
