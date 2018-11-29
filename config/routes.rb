Rails.application.routes.draw do
  resources :porfolios, except: [:show]
  get 'porfolio/:id', to: 'porfolios#show', as: 'porfolio_show'
  get 'pages/home'
  get 'about-me', to: 'pages#about'
  get 'contact', to:'pages#contact'
  resources :blogs
  
  root to: 'pages#home'

end
