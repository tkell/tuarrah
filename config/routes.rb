Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :questions do 
    resources :answers
  end

  get 'question/random', to: 'questions#random'

  get 'cookies/verify', to: 'cookies#verify'
end
