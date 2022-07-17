Rails.application.routes.draw do
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about'
end

# i% [crea un array de simbolos sin comas]
# w% [crea un array de strings sin comas]