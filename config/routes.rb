Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "user/registrations"}

    root to: 'pages#index'

    # Pages controller
    get '/mypage', to: 'pages#mypage', as: 'mypage'
    get '/donation', to: 'pages#donation', as: 'donation'
    post '/donation', to: 'pages#donation'

    # Pets controller
    get '/pets', to: 'pets#index', as: 'pets'
    get '/pets/new', to: 'pets#new', as: 'new_pet'
    post '/pets/', to: 'pets#create', as: 'create_pet'
    get '/pets/:id', to: 'pets#show', as: 'pet'
    put '/pets/:id', to: 'pets#update'
    patch '/pets/:id', to: 'pets#update'
    delete '/pets/:id', to: 'pets#destroy', as: 'delete_pet'
    get '/pets/:id/edit', to: 'pets#edit', as: 'edit_pet'
    get '/pets/:id/foster_request', to: 'pets#foster_request', as: 'foster_request'
end