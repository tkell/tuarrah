Rails.application.routes.draw do
  resources :questions do 
    resources :answers
  end
  get 'question/random', to: 'questions#random'
  resources :cookies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
