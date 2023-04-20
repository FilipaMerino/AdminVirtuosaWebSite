Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :posts, only: [:create, :new, :show, :index, :edit, :destroy]

  resources :testimonials, only: [:create, :index, :new, :index, :edit, :destroy]



  patch '/posts/:id', to: 'posts#update'
  patch '/testimonials/:id', to: 'testimonials#update'


  devise_scope :user do
    get "/admin", to: "devise/sessions#new"
  end

end
