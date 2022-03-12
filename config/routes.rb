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
    
    # Foster Requests
    get '/pets/:id', to: 'pets#show', as: 'foster_requests'
    get '/pets/:id/new_foster_request', to: 'foster_requests#new', as: 'new_foster_request'
    post '/pets/:id/new_foster_request', to: 'foster_requests#create'
    get '/foster_requests/:id/show', to: 'foster_requests#show', as: 'show_foster_reqeust'
    get '/pets/:id/review_foster_requests', to: 'foster_requests#review', as: 'review_foster_requests'
end