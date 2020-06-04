Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  #resources :answers, only: [:create]
  resources :users, only: [:show]
  resources :questions, only: [:create, :destroy,] do
    collection do 
      get 'category'
    end
  end
  get 'questions/:category_id/new' => 'questions#new'
  post 'questions/:id'  => 'questions#achive'
  delete 'questions/:id/indestroy' => 'questions#indestroy'
end
