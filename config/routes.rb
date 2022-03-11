Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "user/registrations"}

    root to: 'pages#index'

    get '/donation', to: 'pages#donation', as: 'donation'
    post '/donation', to: 'pages#donation'
end
