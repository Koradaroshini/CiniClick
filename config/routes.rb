Rails.application.routes.draw do
  get "tickets/show"
  get "payments/new"
  get "payments/create"
  get "booking_review/show"
  resources :bookings
  get "showtime_gallery/index"
  get "theater_gallery/index"
  resources :showtimes
  get "movies_gallery/index"
  resources :movies
  get "admin/login"
  devise_for :users
  get "home/index"
  root "home#index"
get 'showtime_gallery', to: 'showtime_gallery#index'

resources :bookings do
    member do
      get :booking_review
    end
  end
resources :booking_review, only: [:show]
 get 'tickets/:id', to: 'tickets#show', as: 'ticket'

  resources :tickets, only: [:show]

resources :theaters do
    resources :showtimes, only: [:index, :new, :create]
  end

resources :showtimes do
  resources :bookings, only: [:index, :new, :create]
end

  resources :showtime_gallery, only: [:index]
  resources :payments, only: [:new, :create]

resources :theaters

  get 'home', to: 'home#index', as: 'home'
    get 'admin', to: 'admin#index', as: 'admin'
  post "admin/login"
  get "admin/login"

  get "admin/logout"
  resources :theater_gallery, only: [:index]
resources :bookings, only: [:index, :new, :create]

  resources :movies
  get 'movies_gallery', to: 'movies_gallery#index', as: 'movies_gallery'
  post 'book_ticket/:id', to: 'movies_gallery#book_ticket', as: 'book_ticket'

   authenticated :user do
    root 'movies_gallery#index', as: :authenticated_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
