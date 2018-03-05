Rails.application.routes.draw do
  resources :messages do
    member do
      get :sign_in
    end
  end

  get '/sign_in', controller: 'messages', action: 'sign_in'

  root "messages#sign_in"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
