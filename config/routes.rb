Rails.application.routes.draw do
  put '/news/:id/', to: 'entries#update_put'
  patch 'news/:id', to: 'entries#update_patch'
  resources :entries, path: 'news' do
    put '/comments/:id/', to: 'comments#update_put'
    patch 'comments/:id', to: 'comments#update_patch'
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
