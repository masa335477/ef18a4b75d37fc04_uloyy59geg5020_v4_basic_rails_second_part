Rails.application.routes.draw do
  root "static_pages#top"
  resources :users, only: %i[new create] do

  end
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create destroy]
    collection do
      get :bookmarks
    end

  end
  resources :password_resets, only: %i[new create edit update]
  resources :bookmarks, only: %i[create destroy]

  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
