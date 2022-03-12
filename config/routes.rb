Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "user/registrations"}

    root to: 'pages#index'

    # Pages
    get '/mypage', to: 'pages#mypage', as: 'mypage'
    get '/donation', to: 'pages#donation', as: 'donation'
    post '/donation', to: 'pages#donation'

    # Pets
    get '/pets', to: 'pets#index', as: 'pets'
    get '/pets/new', to: 'pets#new', as: 'new_pet'
    post '/pets', to: 'pets#create'
    get '/pets/:id', to: 'pets#show', as: 'pet'
    put '/pets/:id', to: 'pets#update'
    patch '/pets/:id', to: 'pets#update'
    delete '/pets/:id', to: 'pets#destroy', as: 'delete_pet'
    get '/pets/:id/edit', to: 'pets#edit', as: 'edit_pet'
    get '/pets/:id/new_foster_request', to: 'pets#new_foster_request', as: 'new_foster_request'
    post '/pets/:id/new_foster_request', to: 'pets#create_foster_request'
    get '/pets/:id/review_foster_requests', to: 'pets#review_foster_requests', as: 'review_foster_requests'
end