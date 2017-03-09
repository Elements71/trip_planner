Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'country/:country', to:'country#show'
  get 'country/', to:'country#index'
end
